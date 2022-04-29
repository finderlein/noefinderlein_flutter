import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:noefinderlein_flutter/src/database/tables/open_day.dart';
import 'dart:developer' as developer;

// import '../model/model_noec_location.dart';
import '../database/tables/province.dart';
import '../database/tables/region.dart';
import '../database/tables/category.dart';
import '../model/API/current_ids.dart';
import '../database/tables/location.dart';
import '../database/database_helper.dart';

import '../model/model_downloader_progress.dart';

import '../../auth/secrets.dart';

class DataDownloader {
  final String apiUrl = dataApi;
  final int dayPkgCount = 500;

  Stream<DownloaderProgressNull> refresh(int year) async* {
    try {
      final loadChangesResponse = await http.get(Uri.parse(
          '${apiUrl}Changevals/getCurrentIds?year=${year.toString()}'));
      CurrentIds yearData;
      if (loadChangesResponse.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        yearData = CurrentIds.fromJson(json.decode(loadChangesResponse.body));
        yield* refreshSec(year, yearData);
      }
    } catch (error) {
      final d = DownloaderProgressNull();
      d.error = error.toString();
      yield d;
    }
  }

  Stream<DownloaderProgressNull> refreshSec(
      int year, CurrentIds yearData) async* {
    bool loadOpenData = true;
    bool dataget = false;
    final d = DownloaderProgressNull();
    d.current = 0;
    d.max = 400;
    yield d;
    // CurrentIds yearData = noefinderleinAPI.loadChanges(year).execute().body();
    final loadChangesResponse = await http.get(
        Uri.parse('${apiUrl}Changevals/getCurrentIds?year=${year.toString()}'));

    bool updateneeded =
        await DatabaseHelper.updateForYearNeeded(year, yearData.changeid);
    int currentChangeIdInDB = await DatabaseHelper.getCurrentLastChangeId(year);
    // updateneeded = true;
    developer.log('updateneeded:',
        name: 'data_downloader.dart',
        error: '$updateneeded $year ${yearData.changeid}');
    if (updateneeded) {
      dataget = true;
      String putBody = await DatabaseHelper.getStringAktDates(year);
      final uri = Uri.parse('${apiUrl}Locations/getChangedDestinationIds');
      final getChangedDastinationsResponse = await http.put(uri,
          headers: {"Content-Type": "application/json"}, body: putBody);

      List<int> changedLocationIds;
      if (getChangedDastinationsResponse.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        changedLocationIds =
            List<int>.from(json.decode(getChangedDastinationsResponse.body));
        // print('changedLocationIds: $changedLocationIds');
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load post');
      }

      yield* _updatewiththisJsondata(
          changedLocationIds, year, yearData.changeid);
    }
    developer.log('loadOpendata:',
        name: 'data_downloader.dart', error: loadOpenData);
    developer.log('Day Update neeeded?:',
        name: 'data_downloader.dart',
        error:
            '$currentChangeIdInDB/${yearData.daysChngId} - ${currentChangeIdInDB < yearData.daysChngId}');
    if (loadOpenData && currentChangeIdInDB < yearData.daysChngId) {
      dataget = true;
      int downloadChangeAnz = yearData.daysChangeCount;
      double anzPackagesD = (downloadChangeAnz / dayPkgCount) + 1;
      int anzPackages = anzPackagesD.round();
      developer.log('gesamt und anzahl an x packages',
          name: 'data_downloader.dart',
          error: "$downloadChangeAnz $anzPackages");
      yield* downloadSegment(
          year, yearData.daysChangeCount, anzPackages, 0, 0, downloadChangeAnz);
    }

    if (dataget) {
      final oks = DownloaderProgressNull();
      final regionResponse = await http.get(Uri.parse('${apiUrl}Regions'));
      if (regionResponse.statusCode == 200) {
        await DatabaseHelper.insertOrReplaceRegions(
            regionListFromAPIJson(json.decode(regionResponse.body)));
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load regions');
      }
      oks.region = true;
      yield oks;

      final provinceResponse = await http.get(Uri.parse('${apiUrl}Provinces'));
      if (provinceResponse.statusCode == 200) {
        await DatabaseHelper.insertOrReplaceProvinces(
            provinceListFromAPIJson(json.decode(provinceResponse.body)));
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load regions');
      }
      oks.province = true;
      yield oks;

      final categoryResponse = await http.get(Uri.parse('${apiUrl}Categories'));
      if (categoryResponse.statusCode == 200) {
        await DatabaseHelper.insertOrReplaceCategories(
            categoryListFromAPIJson(json.decode(categoryResponse.body)));
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load regions');
      }
      oks.category = true;
      yield oks;
    }
  }

  Stream<DownloaderProgressNull> downloadSegment(
      int year,
      int completeEndChangeId,
      int pkgCount,
      int progressC,
      int counter,
      int downloadChangeAnz) async* {
    int beginsegment = await DatabaseHelper.getCurrentLastChangeId(year);
    developer.log('status',
        name: 'data_downloader.dart',
        error:
            "counter: $counter pkgCount: $pkgCount beginsegment: $beginsegment completeEndChangeId: $completeEndChangeId");
    if (counter < (pkgCount + 20) && beginsegment < completeEndChangeId) {
      final segmentResponse = await http.get(Uri.parse(
          '${apiUrl}Days/getChangeSegmentCount?year=$year&changeStart=$beginsegment&count=$dayPkgCount'));
      if (segmentResponse.statusCode == 200) {
        List<OpenDay> changedLocationIds =
            openDayListFromAPIJson(json.decode(segmentResponse.body), year);
        developer.log('status',
            name: 'data_downloader.dart',
            error: "got changes count: ${changedLocationIds.length}");

        int inserted = await DatabaseHelper.insertOpenDays(changedLocationIds);
        final d = DownloaderProgressNull();
        d.dcurrent = progressC + inserted + .0;
        d.dmax = downloadChangeAnz + .0;
        yield d;
        yield* downloadSegment(year, completeEndChangeId, pkgCount,
            (progressC + inserted), (counter + 1), downloadChangeAnz);
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load segment');
      }
    }
  }

  Stream<DownloaderProgressNull> _updatewiththisJsondata(
      List<int> nummern, int year, int changeid) async* {
    int anzahlakt = nummern.length;
    int zael = 0;

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
      // print('putBody: $putBody');
      List<Location> changedLocationIds;
      final getLocationToIdsResponse = await http.put(
          Uri.parse('${apiUrl}Locations/getLocationsToIds'),
          headers: {"Content-Type": "application/json"},
          body: putBody);

      if (getLocationToIdsResponse.statusCode == 200) {
        // If server returns an OK response, parse the JSON.
        changedLocationIds =
            locationListFromAPIJson(json.decode(getLocationToIdsResponse.body));
        // print('newLocations $changedLocationIds');
      } else {
        // If that response was not OK, throw an error.
        throw Exception('Failed to load put');
      }

      await DatabaseHelper.insertOrReplaceLocations(changedLocationIds);

      zael = zael + changedLocationIds.length;
      final d = DownloaderProgressNull();
      developer.log('count',
          name: 'data_downloader.dart',
          error:
              "zael: $zael, added: ${changedLocationIds.length}, i: $i, anzahlakt: $anzahlakt");
      d.current = zael + .0;
      d.max = anzahlakt + .0;
      yield d;
    }
    await DatabaseHelper.updateChangeId(year, changeid);
  }

  List<OpenDay> openDayListFromAPIJson(List<dynamic> parsedJson, int year) {
    List<OpenDay> days = <OpenDay>[];
    days = parsedJson.map((i) => openDayFromAPIJson(i, year)).toList();
    return days;
  }

  OpenDay openDayFromAPIJson(Map<String, dynamic> json, int year) {
    final object = OpenDay();
    object.active = json['a'] == 1;
    object.changeIndex = json['c'];
    object.day = json['d'];
    object.locationId = json['l'];
    object.year = year;
    return object;
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
