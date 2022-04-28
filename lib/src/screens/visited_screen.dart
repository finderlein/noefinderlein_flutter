import 'package:flutter/material.dart';
import 'package:noefinderlein_flutter/src/database/tables/visited_location.dart';

import '../database/database_helper.dart';
import '../widgets/app_bar_main.dart';
import '../widgets/drawer_main.dart';
import 'dart:developer' as developer;

class VisitedScreen extends StatefulWidget {
  const VisitedScreen({
    Key? key,
    required this.year,
  }) : super(key: key);
  final int year;
  static const routeName = '/visited';

  @override
  State<VisitedScreen> createState() => VisitedScreenState();
}

/// Displays a list of SampleItems.
class VisitedScreenState extends State<VisitedScreen> {
  late Future<List<VisitedLocation>> _allVisitedLocations;
  String customTitle = 'Alle Ziele';

  @override
  void initState() {
    super.initState();
    _allVisitedLocations = DatabaseHelper.getVisited(year: widget.year);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMain(year: widget.year),
        appBar: AppBarMain(
          customTitle: 'Visited',
        ),
        body: FutureBuilder(
          future: _allVisitedLocations,
          builder: (BuildContext context,
              AsyncSnapshot<List<VisitedLocation>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                developer.log('waiting', name: 'visited_screen.dart');
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                developer.log('done', name: 'visited_screen.dart');
                List<VisitedLocation> locations =
                    snapshot.data as List<VisitedLocation>;
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return VisitedList(locations: locations);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }

  Widget VisitedList({required List<VisitedLocation> locations}) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: locations.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(locations[i]);
        });
  }

  Widget _buildRow(VisitedLocation loc) {
    return Card(
        child: ListTile(
      title: Text(
        loc.visitedId.toString(),
        style: const TextStyle(fontSize: 18.0),
      ),
      onTap: () {},
    ));
  }
}
