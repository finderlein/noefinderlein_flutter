import 'dart:async';
import 'dart:developer' as developer;
import 'package:geolocator/geolocator.dart';
import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';

import '../model/model_filter.dart';
import '../model/model_location_with_open.dart';
import '../model/model_location_with_position.dart';
import '../model/model_position_item.dart';
import '../model/model_visited_with_location.dart';
import './tables/location.dart';
import './tables/change_val.dart';
import './tables/open_day.dart';
import './tables/visited_location.dart';
import './tables/region.dart';
import './tables/category.dart';
import './tables/province.dart';
import '../utilities/noefinderlein.dart';
import 'package:intl/intl.dart';

// import '../model/model_noec_location.dart';

class DatabaseHelper {
  static const _databaseName = "noeFinderlein2.30.db";
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

  static Future<List<LocationWithOpen>> getAllLocations(
      {required int year,
      int regionId = 0,
      bool favorites = false,
      String searchString = '',
      String sortBy = 'name',
      FilterElements? filterE}) async {
    Isar db = await DatabaseHelper.db();
    developer.log('regionId',
        name: 'database_helper.dart', error: regionId.toString());
    QueryBuilder<Location, Location, QAfterFilterCondition> locationsb = db
        .locations
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

    if (filterE != null && filterE.filterActive()) {
      if (filterE.badWeather) {
        locationsb = locationsb.badWeatherEqualTo(true);
      }
      if (filterE.childFriendly) {
        locationsb = locationsb.childFriendlyEqualTo(true);
      }
      if (filterE.strollerFriendly) {
        locationsb = locationsb.strollerFriendlyEqualTo(true);
      }
      if (filterE.dogAllowed) {
        locationsb = locationsb.dogAllowedEqualTo(true);
      }
      if (filterE.tavernNear) {
        locationsb = locationsb.tavernNearEqualTo(true);
      }
      if (filterE.wheelchairFriendly) {
        locationsb = locationsb.wheelchairFriendlyEqualTo(true);
      }
      if (filterE.groupsAccepted) {
        locationsb = locationsb.groupsAcceptedEqualTo(true);
      }
      if (filterE.topLocation) {
        locationsb = locationsb.topLocationEqualTo(true);
      }
      if (filterE.openInWinter) {
        locationsb = locationsb.openInWinterEqualTo(true);
      }
    }
    if (sortBy == 'name') {
      locations = await locationsb.sortByName().thenByBookletNumber().findAll();
    } else {
      locations = await locationsb.sortByBookletNumber().thenByName().findAll();
    }
    if (filterE != null && filterE.filterActive()) {
      List<int> catPos = <int>[];
      List<int> catNeg = <int>[];
      for (int i = 0; i < filterE.categories.length; i++) {
        if (filterE.categories[i]) {
          catPos.add(i + 1);
        }
        if (!filterE.categories[i]) {
          catNeg.add(i + 1);
        }
      }
      developer.log('cat',
          name: 'database_helper.dart', error: catPos.join(','));
      developer.log('cat',
          name: 'database_helper.dart', error: catNeg.join(','));
      locations = locations.where((element) {
        if (catNeg.isNotEmpty) {
          return catNeg.contains(element.category);
        } else {
          return catPos.contains(element.category);
        }
      }).toList();
      if (filterE.onlyShowOnDate) {
        List<OpenDay> od = await db.openDays
            .filter()
            .yearEqualTo(year)
            .and()
            .activeEqualTo(true)
            .and()
            .dayEqualTo(DateFormat('yyyy-MM-dd').format(filterE.date))
            .findAll();
        List<int> ids = od.map((e) => e.locationId).toList();
        developer.log('ids',
            name: 'database_helper.dart', error: ids.join(','));
        locations = locations.where((element) {
          return ids.contains(element.id);
        }).toList();
      }
    }
    List<LocationWithOpen> lwo = <LocationWithOpen>[];
    List<OpenDay> od = await db.openDays
        .filter()
        .yearEqualTo(year)
        .and()
        .dayEqualTo(DateFormat('yyyy-MM-dd').format(DateTime.now()))
        .findAll();
    // developer.log('od',
    //     name: 'database_helper.dart',
    //     error: od.map((e) => e.locationId).toList().join(','));
    // developer.log('locations',
    //     name: 'database_helper.dart',
    //     error: locations.map((e) => e.id).toList().join(','));

    for (Location l in locations) {
      LocationWithOpen lw = LocationWithOpen();
      lw.location = l;
      bool found = false;
      for (OpenDay o in od) {
        if (o.locationId == l.id) {
          lw.open = o.active;
          found = true;
          break;
        }
      }

      if (!found) {
        // developer.log('not found', name: 'database_helper.dart', error: l.id);
        lw.open = false;
      }

      lwo.add(lw);
    }
    // print(locations);
    return lwo;
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

  static Future<List<LocationWithPosition>> getAllNearLocations(
      {required int year, required List<Position> positions}) async {
    Isar db = await DatabaseHelper.db();
    List<Location> locs =
        await db.locations.filter().yearEqualTo(year).sortByName().findAll();
    List<LocationWithPosition> returnArr = <LocationWithPosition>[];
    if (positions.isNotEmpty) {
      developer.log('position',
          name: 'database_helper.dart',
          error: '${positions.last.latitude} ${positions.last.longitude}');
    }
    for (Location l in locs) {
      LocationWithPosition newlp = LocationWithPosition();
      newlp.location = l;

      if (positions.isNotEmpty) {
        newlp.distance = Geolocator.distanceBetween(positions.last.latitude,
                positions.last.longitude, l.latitude, l.longitude)
            .toInt();
        if (newlp.distance > 3000) {
          newlp.distanceWithUnit =
              (newlp.distance / 1000).toStringAsFixed(1) + ' km';
        } else {
          newlp.distanceWithUnit = newlp.distance.toString() + ' m';
        }
        newlp.bearing = Geolocator.bearingBetween(positions.last.latitude,
                positions.last.longitude, l.latitude, l.longitude)
            .toInt();
        returnArr.add(newlp);
      }
    }
    returnArr.sort(((a, b) {
      return a.distance - b.distance;
    }));
    return returnArr;
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
      {required double amount,
      required String date,
      required Location location}) async {
    VisitedLocation vl = VisitedLocation();
    vl.visitedLocationId = location.id;
    vl.visitedLoggedDay = date;
    vl.visitedSaved = amount;
    vl.visitedYear = location.year;
    Isar db = await DatabaseHelper.db();
    await db.writeTxn((isar) async {
      await db.visitedLocations.put(vl);
    });
  }

  static Future<List<VisitedWithLocation>> getVisited(
      {required int year}) async {
    Isar db = await DatabaseHelper.db();
    List<VisitedLocation> vl = await db.visitedLocations
        .filter()
        .visitedYearEqualTo(year)
        .sortByVisitedLoggedDay()
        .findAll();
    List<VisitedWithLocation> vwl = <VisitedWithLocation>[];
    for (VisitedLocation l in vl) {
      VisitedWithLocation nvwl = VisitedWithLocation();
      nvwl.visited = l;
      Location? loc = await db.locations.get(l.visitedLocationId);
      if (loc != null) {
        nvwl.location = loc;
        vwl.add(nvwl);
      }
    }
    return vwl;
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
