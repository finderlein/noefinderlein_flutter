import 'package:isar/isar.dart';
// import 'package:noefinderlein_flutter/src/database/tables/location.dart';

part 'visited_location.g.dart';

@Collection()
@Name("VisitedLocation")
class VisitedLocation {
  @Name("id")
  Id visitedId = Isar.autoIncrement;

  int visitedLocationId = 0;
  int visitedYear = 0;

  late String visitedLoggedDay;
  double visitedSaved = 0;
}
