import 'package:isar/isar.dart';

part 'location.g.dart';

@Collection()
@Name("Location")
class Location {
  late Id id;

  @Index()
  late int year;

  int apiId = 0;
  int websiteId = 0;

  int category = 0;
  int region = 0;
  int province = 0;
  late String name;
  int bookletNumber = 0;

  double latitude = 0;
  double longitude = 0;

  late String addressStreet;
  late String addressZip;
  late String addressCity;

  late String telephone;
  late String fax;
  late String email;

  late String website;
  late String travelDirections;
  late String openText;
  late String hint;
  late String description;
  // late String noSpecial;
  late String entryText;
  late String savingsAdult;
  late String savingsChild;

  bool badWeather = false;
  bool childFriendly = false;
  bool strollerFriendly = false;
  bool dogAllowed = false;
  bool tavernNear = false;
  bool wheelchairFriendly = false;
  bool groupsAccepted = false;
  bool topLocation = false;
  bool openInWinter = false;

  late String changedDate;

  int changeIndex = 0;
  bool favorit = false;

  late String searchString;
}
