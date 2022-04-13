class NoecLocation {
  final int id;
  final int year;
  final int category;
  final int region;
  final String name;

  final int bookletNumber;
  final String email;
  final num latitude;
  final num longitude;
  final String addressStreet;
  final String addressZip;
  final String addressCity;
  final String telephone;
  final String fax;
  final String website;
  final String travelDirections;
  final String openText;
  final String hint;
  final String description;
  final String noSpecial;
  final String entryText;
  final String savings;
  final bool wheelchairAllowed;
  final bool stollerAllowed;
  final bool dogAllowed;
  final bool groupsAllowed;
  final bool topLocation;
  final String changedDate;
  final int changeIndex;
  final bool favorit;

  NoecLocation({
    required this.id,
    required this.year,
    required this.category,
    required this.region,
    required this.name,
    required this.bookletNumber,
    required this.email,
    required this.latitude,
    required this.longitude,
    required this.addressStreet,
    required this.addressZip,
    required this.addressCity,
    required this.telephone,
    required this.fax,
    required this.website,
    required this.travelDirections,
    required this.openText,
    required this.hint,
    required this.description,
    required this.noSpecial,
    required this.entryText,
    required this.savings,
    required this.wheelchairAllowed,
    required this.stollerAllowed,
    required this.dogAllowed,
    required this.groupsAllowed,
    required this.topLocation,
    required this.changedDate,
    required this.changeIndex,
    required this.favorit,
  });

  factory NoecLocation.fromAPIJson(Map<String, dynamic> json) {
    NoecLocation location = NoecLocation(
      id: json['id'],
      year: json['jahr'],
      category: json['kat'],
      region: json['reg'],
      name: json['name'],
      bookletNumber: json['nummer'],
      email: json['email'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      addressStreet: json['adr_street'],
      addressZip: json['adr_plz'],
      addressCity: json['adr_ort'],
      telephone: json['tel'],
      fax: json['fax'],
      website: json['webseite'],
      travelDirections: json['anreise'],
      openText: json['geoeffnet'],
      hint: json['tipp'],
      description: json['beschreibung'],
      noSpecial: json['aussersonder'],
      entryText: json['eintritt'],
      savings: json['ersparnis'],
      wheelchairAllowed: json['rollstuhl'],
      stollerAllowed: json['kinderwagen'],
      dogAllowed: json['hund'],
      groupsAllowed: json['gruppe'],
      topLocation: json['top_ausflugsziel'],
      changedDate: json['changed_date'],
      changeIndex: json['change_index'],
      favorit: false,
    );

    return location;
  }
  factory NoecLocation.fromDBMap(Map<String, dynamic> dbMap) {
    NoecLocation location = NoecLocation(
      id: dbMap['id'],
      year: dbMap['year'],
      category: dbMap['category'],
      region: dbMap['region'],
      name: dbMap['name'],
      bookletNumber: dbMap['bookletNumber'],
      email: dbMap['email'],
      latitude: dbMap['latitude'],
      longitude: dbMap['longitude'],
      addressStreet: dbMap['addressStreet'],
      addressZip: dbMap['addressZip'],
      addressCity: dbMap['addressCity'],
      telephone: dbMap['telephone'],
      fax: dbMap['fax'],
      website: dbMap['webseite'],
      travelDirections: dbMap['travelDirections'],
      openText: dbMap['openText'],
      hint: dbMap['hint'],
      description: dbMap['description'],
      noSpecial: dbMap['noSpecial'],
      entryText: dbMap['entryText'],
      savings: dbMap['savings'],
      wheelchairAllowed: dbMap['wheelchairAllowed'] == 1,
      stollerAllowed: dbMap['stollerAllowed'] == 1,
      dogAllowed: dbMap['dogAllowed'] == 1,
      groupsAllowed: dbMap['groupsAllowed'] == 1,
      topLocation: dbMap['topLocation'] == 1,
      changedDate: dbMap['changedDate'],
      changeIndex: dbMap['changeIndex'],
      favorit: false,
    );

    return location;
  }

  Map<String, dynamic> toDBMap() => {
        "id": id,
        "year": year,
        "category": category,
        "region": region,
        "name": name,
        "bookletNumber": bookletNumber,
        "email": email,
        "latitude": latitude,
        "longitude": longitude,
        "addressStreet": addressStreet,
        "addressZip": addressZip,
        "addressCity": addressCity,
        "telephone": telephone,
        "fax": fax,
        "website": website,
        "travelDirections": travelDirections,
        "openText": openText,
        "hint": hint,
        "description": description,
        "noSpecial": noSpecial,
        "entryText": entryText,
        "savings": savings,
        "wheelchairAllowed": wheelchairAllowed,
        "stollerAllowed": stollerAllowed,
        "dogAllowed": dogAllowed,
        "groupsAllowed": groupsAllowed,
        "topLocation": topLocation,
        "changedDate": changedDate,
        "changeIndex": changeIndex,
        "favorit": favorit,
      };
  update(NoecLocation location) {
    // TODO
  }
  @override
  String toString() {
    return "$id $year $category $region $name";
  }
}

class NoecLocationList {
  List<NoecLocation> locations = [];

  NoecLocationList({
    locations,
  });
  get length {
    return locations.length;
  }

  NoecLocation get(int i) {
    return locations[i];
  }

  void add(NoecLocation location) {

    locations.add(location);
  }

  factory NoecLocationList.fromAPIJson(List<dynamic> parsedJson) {
    List<NoecLocation> locations = <NoecLocation>[];
    locations = parsedJson.map((i) => NoecLocation.fromAPIJson(i)).toList();
    NoecLocationList locationsNew = NoecLocationList(
      locations: locations,
    );
    return locationsNew;
  }

  int getLenth() {
    return locations.length;
  }
  @override
  String toString() {
    String returnStr = '';
    for (int i = 0; i < locations.length; i++) {
      returnStr += '${locations[i].id} ';
    }
    return returnStr;
  }
}
