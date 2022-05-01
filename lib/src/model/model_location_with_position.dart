import '../database/tables/location.dart';

class LocationWithPosition {
  late Location location;
  late int distance;
  late int bearing;
  late String distanceWithUnit;
}
