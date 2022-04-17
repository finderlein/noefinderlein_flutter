import 'dart:async';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import './tables/location.dart';
import './tables/change_val.dart';
import './tables/open_day.dart';
import './tables/visited_location.dart';

// import '../model/model_noec_location.dart';

class DatabaseHelper {
  static const _databaseName = "noeFinderlein2.3.db";
  static const _databaseVersion = 1;

  // static final tableLocations = Location.instance;
  // static final tableChangeVal = TableChangeVal.instance;
  // static final tableOpenDays = TableOpenDays.instance;
  // static final tablevisitedLocations = TableVisitedLocations.instance;

  static Future<Isar> db() async {
    final db = Isar.getInstance('mainDB');
    if (db != null) {
      return db;
    }
    final dir = await getApplicationSupportDirectory(); // path_provider package
    final isar = await Isar.open(
        schemas: [
          LocationSchema,
          ChangeValSchema,
          OpenDaySchema,
          VisitedLocationSchema
        ],
        directory: dir.path,
        inspector: true, // if you want to enable the inspector for debug builds
        name: 'mainDB');
    return isar;
  }

  static Future<List<Location>> getAllMenuLocations(
      {required int year, required int regionId, String? query}) async {
    Isar db = await DatabaseHelper.db();
    final locations = await db.locations
        .filter()
        .yearEqualTo(year)
        .regionEqualTo(regionId)
        .sortByBookletNumber()
        .thenByName()
        .findAll();
    return locations;
  }

  static Future<int?> getLocationsCountToYear(int year) async {
    Isar db = await DatabaseHelper.db();
    final count = await db.locations.filter().yearEqualTo(year).count();
    return count;
  }

  static Future<bool> updateForYearNeeded(int year, int changedcount) async {
    Isar db = await DatabaseHelper.db();
    final count = await db.changeVals
        .filter()
        .yearEqualTo(year)
        .changeCountGreaterThan(changedcount - 1)
        .count();
    return count == 0;
  }

  static Future<int> getCurrentLastChangeId(int year) async {
    Isar db = await DatabaseHelper.db();
    int returnVar = 0;
    final day = await db.openDays
        .filter()
        .yearEqualTo(year)
        .sortByChangeIndexDesc()
        .limit(1)
        .findFirst();
    if (day != null) {
      returnVar = day.changeIndex;
    }
    return returnVar;
  }

  static Future<String> getStringAktDates(int year) async {
    Isar db = await DatabaseHelper.db();
    var locations;
    try {
      locations =
          await db.locations.filter().yearEqualTo(year).sortById().findAll();
    } catch (error) {}
    String returnJson = '{"year":${year.toString()}';
    if (locations != null && locations.isNotEmpty) {
      List<String> stringArray = locations
          .map((row) => '{"id":${row.id},"cId":${row.changeIndex}}')
          .toList();
      returnJson += ',"el":[${stringArray.join(',')}]';
    }
    return '$returnJson}';
  }

  static Future<bool> _updateornewForItemNeeded(int id) async {
    Isar db = await DatabaseHelper.db();
    final count = await db.locations.filter().idEqualTo(id).count();
    return count != 0;
  }

  static Future<Location?> getLocationToId({required int id}) async {
    Isar db = await DatabaseHelper.db();
    final locations = await db.locations.filter().idEqualTo(id).findAll();
    if (locations.length == 1) {
      return locations.first;
    }
    return null;
  }

  static Future<void> insertOrReplaceLocations(List<Location> locations) async {
    List<Location> updateList = <Location>[];
    List<Location> insertList = <Location>[];
    for (int i = 0; i < locations.length; i++) {
      try {
        Location location = locations.elementAt(i);

        int id = location.id;
        bool update = await _updateornewForItemNeeded(id);
        if (update) {
          /*NoecLocation existingLocation = await _getLocationToId(id);
          existingLocation.update(location);
          updateList.locations.add(existingLocation);*/
          updateList.add(location);
        } else {
          // insert
          print('insertLocation: $location');
          print('locationsList: $insertList');
          insertList.add(location);
        }
      } catch (e) {
        print(e);
      }
    }
    await _insOrRepl(updateList, insertList);
  }

  static Future<void> _insOrRepl(
      List<Location> updateList, List<Location> insertList) async {
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.locations.putAll(insertList);
    });
    await db.writeTxn((isar) async {
      await db.locations.putAll(updateList);
    });
  }
}
