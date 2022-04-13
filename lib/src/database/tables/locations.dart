class TableLocations {
  // make this a singleton class
  TableLocations._privateConstructor();
  static final TableLocations instance = TableLocations._privateConstructor();

  final String tableName = "locations";
  final String keyId = "id";
  final String keyYear = "year";
  final String keybookletNumber = "bookletNumber";
  final String keyChangeIndex = "changeIndex";
  static final String sqlCreateTable = "" +
      "CREATE TABLE ${instance.tableName} (" +
      "${instance.keyId} INTEGER PRIMARY KEY NOT NULL DEFAULT (0)," +
      "${instance.keyYear} INTEGER DEFAULT (0)," +
      "category INTEGER DEFAULT (0)," +
      "region INTEGER DEFAULT (0)," +
      "name TEXT," +
      "${instance.keybookletNumber} INTEGER DEFAULT (0)," +
      "email INTEGER DEFAULT (0)," +
      "latitude DOUBLE DEFAULT (0)," +
      "longitude DOUBLE DEFAULT (0)," +
      "addressStreet TEXT," +
      "addressZip TEXT," +
      "addressCity TEXT," +
      "telephone TEXT," +
      "fax TEXT," +
      "website TEXT," +
      "travelDirections TEXT," +
      "openText TEXT," +
      "hint TEXT," +
      "description TEXT," +
      "noSpecial TEXT," +
      "entryText TEXT," +
      "savings TEXT," +
      "wheelchairAllowed BOOLEAN DEFAULT (0)," +
      "stollerAllowed BOOLEAN DEFAULT (0)," +
      "dogAllowed BOOLEAN DEFAULT (0)," +
      "groupsAllowed BOOLEAN DEFAULT (0)," +
      "topLocation BOOLEAN DEFAULT (0)," +
      "changedDate TEXT DEFAULT (null)," +
      "${instance.keyChangeIndex} INTEGER DEFAULT (0)," +
      "favorit BOOLEAN DEFAULT (0)" +
      " )";

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
