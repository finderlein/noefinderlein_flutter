import 'dart:async';
import 'dart:developer' as developer;
import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';

import './tables/location.dart';
import './tables/change_val.dart';
import './tables/open_day.dart';
import './tables/visited_location.dart';
import './tables/region.dart';
import './tables/category.dart';
import './tables/province.dart';
import '../utilities/noefinderlein.dart';

// import '../model/model_noec_location.dart';

class DatabaseHelper {
  static const _databaseName = "noeFinderlein2.13.db";
  // static const _databaseVersion = 1;

  // static final tableLocations = Location.instance;
  // static final tableChangeVal = TableChangeVal.instance;
  // static final tableOpenDays = TableOpenDays.instance;
  // static final tablevisitedLocations = TableVisitedLocations.instance;

  static Isar dbSync() {
    Noefinderlein glob = Noefinderlein();
    final db = Isar.getInstance(_databaseName);
    if (db != null) {
      return db;
    }
    final isar = Isar.openSync(
        schemas: [
          LocationSchema,
          ChangeValSchema,
          OpenDaySchema,
          VisitedLocationSchema,
          RegionSchema,
          CategorySchema,
          ProvinceSchema
        ],
        directory: glob.supportDir.path,
        inspector: true, // if you want to enable the inspector for debug builds
        name: _databaseName);
    return isar;
  }

  static Future<Isar> db() async {
    Noefinderlein glob = Noefinderlein();
    final db = Isar.getInstance(_databaseName);
    if (db != null) {
      return db;
    }
    final isar = await Isar.open(
        schemas: [
          LocationSchema,
          ChangeValSchema,
          OpenDaySchema,
          VisitedLocationSchema,
          RegionSchema,
          CategorySchema,
          ProvinceSchema
        ],
        directory: glob.supportDir.path,
        inspector: true, // if you want to enable the inspector for debug builds
        name: _databaseName);
    return isar;
  }

  static Future<List<Location>> getAllLocations(
      {required int year,
      int regionId = 0,
      bool favorites = false,
      String searchString = '',
      String sortBy = 'name'}) async {
    Isar db = await DatabaseHelper.db();
    developer.log('regionId',
        name: 'database_helper.dart', error: regionId.toString());
    final locationsb = db.locations
        .filter()
        .yearEqualTo(year)
        .and()
        .optional(regionId != 0, (q) => q.regionEqualTo(regionId))
        .and()
        .optional(favorites, (q) => q.favoritEqualTo(true))
        .and()
        .optional(
            searchString != '', (q) => q.searchStringContains(searchString));
    List<Location> locations;

    if (sortBy == 'name') {
      locations = await locationsb.sortByName().thenByBookletNumber().findAll();
    } else {
      locations = await locationsb.sortByBookletNumber().thenByName().findAll();
    }
    return locations;
  }

  static Future<void> updateChangeId(int year, int changeid) async {
    ChangeVal val = ChangeVal();
    val.year = year;
    val.changeCount = changeid;
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.changeVals.put(val);
    });
  }

  static String getRegionName(int regionId) {
    Isar db = DatabaseHelper.dbSync();
    final region = db.regions.where().idEqualTo(regionId).findFirstSync();
    if (region != null) {
      return region.name;
    } else {
      return '';
    }
  }

  static Future<List<Region>> getAllRegions() async {
    Isar db = await DatabaseHelper.db();
    final regions = db.regions.where().findAll();
    return regions;
  }

  static Future<int> getLocationsCountToYear(int year) async {
    Isar db = await DatabaseHelper.db();
    final count = await db.locations.filter().yearEqualTo(year).count();
    return count;
  }

  static Future<bool> updateForYearNeeded(int year, int changedcount) async {
    Isar db = await DatabaseHelper.db();
    final changeVal =
        await db.changeVals.filter().yearEqualTo(year).findFirst();
    developer.log('changeVal',
        name: 'database_helper.dart',
        error: '${changeVal?.changeCount} + ${changeVal?.year}');
    developer.log('changedcount',
        name: 'database_helper.dart', error: changedcount);
    if (changeVal == null) {
      return true;
    } else if (changeVal.changeCount < changedcount) {
      return true;
    }
    return false;
  }

  static Future<int> insertOpenDays(List<OpenDay> opendays) async {
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.openDays.putAll(opendays, replaceOnConflict: true);
    });
    return opendays.length;
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
    List<Location> locations = [];
    try {
      locations =
          await db.locations.filter().yearEqualTo(year).sortById().findAll();
    } catch (error) {}
    String returnJson = '{"year":${year.toString()}';
    if (locations.isNotEmpty) {
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

  static Future<List<Location>> getLocationsToIds(
      {required List<int> locationIds}) async {
    Isar db = await DatabaseHelper.db();
    final locations = await db.locations
        .filter()
        .repeat(locationIds, (q, int locId) => q.idEqualTo(locId))
        .findAll();
    if (locations.isNotEmpty) {
      return locations;
    }
    return [];
  }

  static Future<Location> getLocationToId({required int id}) async {
    Isar db = await DatabaseHelper.db();
    final locations = await db.locations.filter().idEqualTo(id).findAll();
    if (locations.length == 1) {
      return locations.first;
    }
    return Location();
  }

  static Future<void> saveVisited(
      {required int year,
      required int locationId,
      required double amount,
      required String date}) async {
    VisitedLocation vl = VisitedLocation();
    vl.visitedLocationId = locationId;
    vl.visitedLoggedDay = date;
    vl.visitedSaved = amount;
    vl.visitedYear = year;
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.visitedLocations.put(vl);
    });
  }

  static Future<List<VisitedLocation>> getVisited({required int year}) async {
    Isar db = await DatabaseHelper.db();
    List<VisitedLocation> vl = await db.visitedLocations
        .filter()
        .visitedYearEqualTo(year)
        .sortByVisitedLoggedDay()
        .findAll();
    return vl;
  }

  static Future<void> setFavUnfav(Location loc, bool fav) async {
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      loc.favorit = fav;
      await db.locations.put(loc);
    });
  }

  static Future<void> insertOrReplaceRegions(List<Region> regions) async {
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.regions.putAll(regions);
    });
  }

  static Future<void> insertOrReplaceProvinces(List<Province> province) async {
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.provinces.putAll(province);
    });
  }

  static Future<void> insertOrReplaceCategories(List<Category> category) async {
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.categorys.putAll(category);
    });
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
          // print('insertLocation: $location');
          // print('locationsList: $insertList');
          insertList.add(location);
        }
      } catch (e) {
        // print(e);
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
