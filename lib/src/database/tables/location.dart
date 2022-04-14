import 'package:isar/isar.dart';

part 'location.g.dart';

@Collection()
@Name("Location")
class Location {
  
  @Id()
  late int id;

  @Index()
  late int year;

  int category = 0;
  int region = 0;
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
  late String noSpecial;
  late String entryText;
  late String savings;

  bool wheelchairAllowed = false;
  bool stollerAllowed = false;
  bool dogAllowed = false;
  bool groupsAllowed = false;
  bool topLocation = false;


  late String changedDate;

  int changeIndex = 0;
  bool favorit = false;
}

