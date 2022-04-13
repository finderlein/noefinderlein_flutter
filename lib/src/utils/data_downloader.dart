import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import '../model/model_noec_location.dart';
import '../model/API/current_ids.dart';
import '../database/database_helper.dart';

class DataDownloader {
  final String apiUrl = "https://noecard.reitschmied.at/api/";
  Stream<num> refresh(int year) async* {
    yield 0.0;
    //CurrentIds yearData = noefinderleinAPI.loadChanges(year).execute().body();
    final loadChangesResponse = await http
        .get(Uri.parse('${apiUrl}Changevals/getCurrentIds?year=${year.toString()}'));
    CurrentIds yearData;
    if (loadChangesResponse.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      yearData = CurrentIds.fromJson(json.decode(loadChangesResponse.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
    if (yearData != null) {
      bool updateneeded = await DatabaseHelper.updateForYearNeeded(year, yearData.changeid);
      int currentChangeIdInDB = await DatabaseHelper.getCurrentLastChangeId(year);
      if (updateneeded) {
        String putBody = await DatabaseHelper.getStringAktDates(year);
        final uri = Uri.parse(
            '${apiUrl}Locations/getChangedDestinationIds');
        final getChangedDastinationsResponse = await http.put(uri,
            headers: {"Content-Type": "application/json"},
            body: putBody);

        List<int> changedLocationIds;
        if (getChangedDastinationsResponse.statusCode == 200) {
          // If server returns an OK response, parse the JSON.
          changedLocationIds = List<int>.from(
              json.decode(getChangedDastinationsResponse.body));
          print('changedLocationIds: ' + changedLocationIds.toString());
        } else {
          // If that response was not OK, throw an error.
          throw Exception('Failed to load post');
        }
        if (changedLocationIds != null) {
          yield* _updatewiththisJsondata(changedLocationIds);

          //await DatabaseHelper.updateChangeId(year, yearData.changeid);
        }
      }
    } else {
      //mCallbacks.onDownloadError("No Location data yet for year: " + year.toString());
    }
  }

  Stream<num> _updatewiththisJsondata(List<int> nummern) async* {
    int anzahlakt = nummern.length;
    int zael = 1;
    //progress.setMax(anzahlakt);

    List<String> idList = <String>[];

    for (int i = 0; i < anzahlakt; i++) {
      idList.add(nummern[i].toString());
    }
    int partitionSize = 20;
    List<List<String>> partitions = <List<String>>[];
    for (int i = 0; i < anzahlakt; i += partitionSize) {
      partitions
          .add(idList.sublist(i, min(i + partitionSize, idList.length)));
    }
    for (int i = 0; i < partitions.length; i++) {
      String putBody = '{"arr":[${partitions[i].join(',')}]}';
      print('putBody: $putBody');
      NoecLocationList changedLocationIds;
      final getLocationToIdsResponse = await http.put(Uri.parse(
          '${apiUrl}Locations/getLocationsToIds'),
          headers: {"Content-Type": "application/json"},
          body: putBody);

      if (getLocationToIdsResponse.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        changedLocationIds = NoecLocationList.fromAPIJson(
            json.decode(getLocationToIdsResponse.body));
        print('newLocations $changedLocationIds');
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load put');
      }

      await DatabaseHelper.insertOrReplaceLocations(changedLocationIds);

      zael = zael + changedLocationIds.getLenth();
      //mBuilder.setProgress(anzahlakt, zael, false);
      //mNotifyManager.notify(2, mBuilder.build());
      //progress.setProgress(zael);
      yield zael;

    }
  }
}
