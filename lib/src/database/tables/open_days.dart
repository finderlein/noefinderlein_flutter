class TableOpenDays {
  // make this a singleton class
  TableOpenDays._privateConstructor();
  static final TableOpenDays instance = TableOpenDays._privateConstructor();

  final String tableName = "openDays";
  final String keyYear = "year";
  final String keyDay = "day";
  final String keyLocationId = "locationId";
  final String keyActive = "active";
  final String keyChangeIndex = "changeIndex";

  static final String sqlCreateTable = "CREATE TABLE ${instance.tableName} (${instance.keyDay} TEXT NOT NULL,${instance.keyLocationId} INTEGER NOT NULL,${instance.keyYear} INTEGER DEFAULT (0),${instance.keyActive} BOOLEAN DEFAULT (1),${instance.keyChangeIndex} INTEGER DEFAULT (0),PRIMARY KEY (${instance.keyDay}, ${instance.keyLocationId}) )";
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
