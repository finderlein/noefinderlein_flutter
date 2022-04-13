import 'package:drift/drift.dart';

part 'tables.g.dart';

@DataClassName('Location')
class Locations extends Table {
  @override
  String get tableName => 'locations';
  IntColumn get id => integer()();
  IntColumn get year => integer()();
  IntColumn get category =>
      integer().nullable().withDefault(const Constant(0))();
  IntColumn get region => integer().nullable().withDefault(const Constant(0))();
  TextColumn get name => text()();
  IntColumn get bookletNumber =>
      integer().nullable().withDefault(const Constant(0))();
  TextColumn get email => text()();
  RealColumn get latitude => real().withDefault(const Constant(0))();
  RealColumn get longitude => real().withDefault(const Constant(0))();
  TextColumn get addressStreet => text()();
  TextColumn get addressZip => text()();
  TextColumn get addressCity => text()();
  TextColumn get telephone => text()();
  TextColumn get fax => text()();
  TextColumn get website => text()();
  TextColumn get travelDirections => text()();
  TextColumn get openText => text()();
  TextColumn get hint => text()();
  TextColumn get description => text()();
  TextColumn get noSpecial => text()();
  TextColumn get entryText => text()();
  TextColumn get savings => text()();
  BoolColumn get wheelchairAllowed =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get stollerAllowed =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get dogAllowed => boolean().withDefault(const Constant(false))();
  BoolColumn get groupsAllowed =>
      boolean().withDefault(const Constant(false))();
  BoolColumn get topLocation => boolean().withDefault(const Constant(false))();
  TextColumn get changedDate =>
      text().nullable().withDefault(const Constant(null))();
  IntColumn get changeIndex => integer().withDefault(const Constant(0))();
  BoolColumn get favorit => boolean().withDefault(const Constant(false))();

  @override
  Set<Column> get primaryKey => {id, year};
}

@DataClassName('Openday')
class OpenDays extends Table {
  @override
  String get tableName => 'openDays';

  TextColumn get day => text()();
  IntColumn get locationId => integer()();
  IntColumn get year => integer()();
  BoolColumn get active => boolean().withDefault(const Constant(true))();
  IntColumn get changeIndex => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {day, locationId};
}

@DataClassName('Changeval')
class ChangeVals extends Table {
  @override
  String get tableName => 'changeval';

  IntColumn get changeYear => integer().withDefault(const Constant(0))();
  IntColumn get changeCount => integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {changeYear};
}

@DataClassName('Visited')
class Visited extends Table {
  @override
  String get tableName => 'visited';

  IntColumn get visitedId => integer().withDefault(const Constant(0))();
  IntColumn get visitedLocationId => integer().withDefault(const Constant(0))();
  IntColumn get visitedYear => integer().withDefault(const Constant(0))();
  TextColumn get visitedLoggedDay => text().nullable().withDefault(const Constant(null))();
  BoolColumn get visitedAccepted => boolean().withDefault(const Constant(false))();
  RealColumn get visitedLatitude => real().withDefault(const Constant(0))();
  RealColumn get visitedLongitude => real().withDefault(const Constant(0))();
  RealColumn get visitedSaved => real().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {visitedId};
}

