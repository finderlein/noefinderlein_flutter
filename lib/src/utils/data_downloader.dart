import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

// import '../model/model_noec_location.dart';
import '../model/API/current_ids.dart';
import '../database/tables/location.dart';
import '../database/database_helper.dart';

import '../model/model_downloader_progress.dart';

class DataDownloader {
  final String apiUrl = "https://noecard.reitschmied.at/api/";
  Stream<DownloaderProgress> refresh(int year) async* {
    final d = DownloaderProgress();
    d.current = 0;
    yield d;
    //CurrentIds yearData = noefinderleinAPI.loadChanges(year).execute().body();
    final loadChangesResponse = await http.get(
        Uri.parse('${apiUrl}Changevals/getCurrentIds?year=${year.toString()}'));
    CurrentIds yearData;
    if (loadChangesResponse.statusCode == 200) {
      // If server returns an OK response, parse the JSON.
      yearData = CurrentIds.fromJson(json.decode(loadChangesResponse.body));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load post');
    }
    if (yearData != null) {
      bool updateneeded =
          await DatabaseHelper.updateForYearNeeded(year, yearData.changeid);
      int currentChangeIdInDB =
          await DatabaseHelper.getCurrentLastChangeId(year);
      if (updateneeded) {
        String putBody = await DatabaseHelper.getStringAktDates(year);
        final uri = Uri.parse('${apiUrl}Locations/getChangedDestinationIds');
        final getChangedDastinationsResponse = await http.put(uri,
            headers: {"Content-Type": "application/json"}, body: putBody);

        List<int> changedLocationIds;
        if (getChangedDastinationsResponse.statusCode == 200) {
          // If server returns an OK response, parse the JSON.
          changedLocationIds =
              List<int>.from(json.decode(getChangedDastinationsResponse.body));
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

  Stream<DownloaderProgress> _updatewiththisJsondata(List<int> nummern) async* {
    int anzahlakt = nummern.length;
    int zael = 1;

    List<String> idList = <String>[];

    for (int i = 0; i < anzahlakt; i++) {
      idList.add(nummern[i].toString());
    }
    int partitionSize = 20;
    List<List<String>> partitions = <List<String>>[];
    for (int i = 0; i < anzahlakt; i += partitionSize) {
      partitions.add(idList.sublist(i, min(i + partitionSize, idList.length)));
    }
    for (int i = 0; i < partitions.length; i++) {
      String putBody = '{"arr":[${partitions[i].join(',')}]}';
      print('putBody: $putBody');
      List<Location> changedLocationIds;
      final getLocationToIdsResponse = await http.put(
          Uri.parse('${apiUrl}Locations/getLocationsToIds'),
          headers: {"Content-Type": "application/json"},
          body: putBody);

      if (getLocationToIdsResponse.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        changedLocationIds =
            locationListFromAPIJson(json.decode(getLocationToIdsResponse.body));
        print('newLocations $changedLocationIds');
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load put');
      }

      await DatabaseHelper.insertOrReplaceLocations(changedLocationIds);

      zael = zael + changedLocationIds.length;
      final d = DownloaderProgress();
      d.current = zael;
      d.max = anzahlakt;
      yield d;
    }
  }

  List<Location> locationListFromAPIJson(List<dynamic> parsedJson) {
    List<Location> locations = <Location>[];
    locations = parsedJson.map((i) => locationFromAPIJson(i)).toList();
    return locations;
  }

  Location locationFromAPIJson(Map<String, dynamic> json) {
    final object = Location();
    object.id = json['id'];

    object.year = json['jahr'];
    object.category = json['kat'];
    object.region = json['reg'];
    object.name = json['name'];
    object.bookletNumber = json['nummer'];
    object.email = json['email'];
    object.latitude = json['latitude'] + .0;
    object.longitude = json['longitude'] + .0;
    object.addressStreet = json['adr_street'];
    object.addressZip = json['adr_plz'];
    object.addressCity = json['adr_ort'];
    object.telephone = json['tel'];
    object.fax = json['fax'];
    object.website = json['webseite'];
    object.travelDirections = json['anreise'];
    object.openText = json['geoeffnet'];
    object.hint = json['tipp'];
    object.description = json['beschreibung'];
    object.noSpecial = json['aussersonder'];
    object.entryText = json['eintritt'];
    object.savings = json['ersparnis'];
    object.wheelchairAllowed = json['rollstuhl'];
    object.stollerAllowed = json['kinderwagen'];
    object.dogAllowed = json['hund'];
    object.groupsAllowed = json['gruppe'];
    object.topLocation = json['top_ausflugsziel'];
    object.changedDate = json['changed_date'];
    object.changeIndex = json['change_index'];
    object.favorit = false;

    return object;
  }
}
