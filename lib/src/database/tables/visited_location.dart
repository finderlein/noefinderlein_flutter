import 'package:isar/isar.dart';

part 'visited_location.g.dart';

@Collection()
@Name("VisitedLocation")
class VisitedLocation {
  @Id()
  int visitedId = Isar.autoIncrement;

  int visitedLocationId = 0;
  int visitedYear = 0;

  String? visitedLoggedDay;
  bool visitedAccepted = false;
  double visitedLatitude = 0;
  double visitedLongitude = 0;
  double visitedSaved = 0;
}
