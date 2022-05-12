// import 'package:flutter/material.dart';
// import 'package:path/path.dart';
// import 'package:sqflite/sqflite.dart';

// class AndroidMigrationScreen extends StatefulWidget {
//   const AndroidMigrationScreen({
//     Key? key,
//   }) : super(key: key);

//   static const routeName = '/androidMigration';

//   @override
//   State<AndroidMigrationScreen> createState() => _AndroidMigrationScreenState();
// }

// class _AndroidMigrationScreenState extends State<AndroidMigrationScreen> {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     throw UnimplementedError();
//   }
// }

// void main() async {
//   final database = openDatabase(
//     // Set the path to the database. Note: Using the `join` function from the
//     // `path` package is best practice to ensure the path is correctly
//     // constructed for each platform.
//     join(await getDatabasesPath(), 'doggie_database.db'),
//   );
//   Future<List<Dog>> dogs() async {
//     // Get a reference to the database.
//     final db = await database;

//     // Query the table for all The Dogs.
//     final List<Map<String, dynamic>> maps = await db.query('dogs', where: '', whereArgs: []);

//     // Convert the List<Map<String, dynamic> into a List<Dog>.
//     return List.generate(maps.length, (i) {
//       return Dog(
//         id: maps[i]['id'],
//         name: maps[i]['name'],
//         age: maps[i]['age'],
//       );
//     });
//   }
// }

// class Dog {}
