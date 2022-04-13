class TableVisitedLocations {
  // make this a singleton class
  TableVisitedLocations._privateConstructor();
  static final TableVisitedLocations instance =
      TableVisitedLocations._privateConstructor();

  final String tableName = "visited";

  final String keyId = "visitedId";
  final String keyYear = "visitedYear";
  final String keyLocationId = "visitedLocationId";
  final String keyLoggedDay = "visitedLoggedDay";
  final String keyAccepted = "visitedAccepted";
  final String keyLatitude = "visitedLatitude";
  final String keyLongitude = "visitedLongitude";
  final String keySaved = "visitedSaved";

  static final String sqlCreateTable = "CREATE TABLE ${instance.tableName} (${instance.keyId} INTEGER PRIMARY KEY NOT NULL DEFAULT (0),${instance.keyLocationId} INTEGER DEFAULT (0),${instance.keyYear} INTEGER DEFAULT (0),${instance.keyLoggedDay} TEXT DEFAULT (null),${instance.keyAccepted} BOOLEAN DEFAULT (0),${instance.keyLatitude}  DOUBLE DEFAULT (0),${instance.keyLongitude}  DOUBLE DEFAULT (0),${instance.keySaved}  DOUBLE DEFAULT (0) )";
  static onCreate(db, version) {
    return db.execute(sqlCreateTable);
  }

  static onUpgrade(db, oldVersion, newVersion) {
    switch (oldVersion) {
      case 1:
    }
  }

  static onDowngrade(db, oldVersion, newVersion) {
    switch (newVersion) {
      case 1:
    }
  }
}
