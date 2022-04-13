class TableChangeVal {
  // make this a singleton class
  TableChangeVal._privateConstructor();
  static final TableChangeVal instance = TableChangeVal._privateConstructor();

  final String tableName = "changeval";
  final String keyChangeYear = "changeYear";
  final String keyChangeCount = "changeCount";
  static final String sqlCreateTable = "CREATE TABLE ${instance.tableName} (${instance.keyChangeYear} INTEGER PRIMARY KEY NOT NULL DEFAULT (0),${instance.keyChangeCount} INTEGER DEFAULT (0) )";

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
