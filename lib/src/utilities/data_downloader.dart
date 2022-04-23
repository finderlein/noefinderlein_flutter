import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

// import '../model/model_noec_location.dart';
import '../database/tables/province.dart';
import '../database/tables/region.dart';
import '../database/tables/category.dart';
import '../model/API/current_ids.dart';
import '../database/tables/location.dart';
import '../database/database_helper.dart';

import '../model/model_downloader_progress.dart';

class DataDownloader {
  final String apiUrl = "https://noecard.reitschmied.at/apiv2/";
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
    final regionResponse = await http.get(Uri.parse('${apiUrl}Regions'));
    if (regionResponse.statusCode == 200) {
      await DatabaseHelper.insertOrReplaceRegions(
          regionListFromAPIJson(json.decode(regionResponse.body)));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load regions');
    }

    final provinceResponse = await http.get(Uri.parse('${apiUrl}Provinces'));
    if (provinceResponse.statusCode == 200) {
      await DatabaseHelper.insertOrReplaceProvinces(
          provinceListFromAPIJson(json.decode(provinceResponse.body)));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load regions');
    }

    final categoryResponse = await http.get(Uri.parse('${apiUrl}Categories'));
    if (categoryResponse.statusCode == 200) {
      await DatabaseHelper.insertOrReplaceCategories(
          categoryListFromAPIJson(json.decode(categoryResponse.body)));
    } else {
      // If that response was not OK, throw an error.
      throw Exception('Failed to load regions');
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
      d.current = zael + .0;
      d.max = anzahlakt + .0;
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
    object.apiId = json['apiId'];
    object.websiteId = json['websiteId'];

    object.year = json['year'];
    object.category = json['category'];
    object.region = json['region'];
    object.province = json['province'];
    object.name = json['name'];
    object.bookletNumber = json['bookletId'];
    object.latitude = json['latitude'] + .0;
    object.longitude = json['longitude'] + .0;
    object.addressStreet = json['addressStreet'];
    object.addressZip = json['addressZip'];
    object.addressCity = json['addressCity'];
    object.telephone = json['telephone'];
    object.fax = json['fax'];
    object.email = json['email'];
    object.website = json['website'];
    object.travelDirections = json['travelDirections'];
    object.openText = json['openText'];
    object.hint = json['tip'];
    object.description = json['description'];
    // object.noSpecial = json['aussersonder'];
    object.entryText = json['entryText'];
    object.savingsAdult = json['savingsAdult'];
    object.savingsChild = json['savingsChild'];
    object.badWeather = json['badWeather'];
    object.childFriendly = json['childFriendly'];
    object.strollerFriendly = json['strollerFriendly'];
    object.dogAllowed = json['dogAllowed'];
    object.tavernNear = json['tavernNear'];
    object.wheelchairFriendly = json['wheelchairFriendly'];
    object.groupsAccepted = json['groupsAccepted'];
    object.topLocation = json['topLocation'];
    object.openInWinter = json['openInWinter'];
    object.changedDate = json['changed_date'];
    object.changeIndex = json['change_index'];
    object.favorit = false;
    object.searchString =
        '${object.name.toLowerCase()} ${object.description.toLowerCase()}';
    return object;
  }

  List<Region> regionListFromAPIJson(List<dynamic> parsedJson) {
    List<Region> locations = <Region>[];
    locations = parsedJson.map((i) => regionFromAPIJson(i)).toList();
    return locations;
  }

  Region regionFromAPIJson(Map<String, dynamic> json) {
    final object = Region();
    object.id = json['id'];
    object.name = json['name'];
    return object;
  }

  List<Province> provinceListFromAPIJson(List<dynamic> parsedJson) {
    List<Province> locations = <Province>[];
    locations = parsedJson.map((i) => provinceFromAPIJson(i)).toList();
    return locations;
  }

  Province provinceFromAPIJson(Map<String, dynamic> json) {
    final object = Province();
    object.id = json['id'];
    object.name = json['name'];
    return object;
  }

  List<Category> categoryListFromAPIJson(List<dynamic> parsedJson) {
    List<Category> locations = <Category>[];
    locations = parsedJson.map((i) => categoryFromAPIJson(i)).toList();
    return locations;
  }

  Category categoryFromAPIJson(Map<String, dynamic> json) {
    final object = Category();
    object.id = json['id'];
    object.name = json['name'];
    return object;
  }
}
