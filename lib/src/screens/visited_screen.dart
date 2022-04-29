import 'package:flutter/material.dart';
import 'package:noefinderlein_flutter/src/database/tables/visited_location.dart';

import '../database/database_helper.dart';
import '../model/model_visited_with_location.dart';
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
  late Future<List<VisitedWithLocation>> _allVisitedLocations;
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
              AsyncSnapshot<List<VisitedWithLocation>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                developer.log('waiting', name: 'visited_screen.dart');
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                developer.log('done', name: 'visited_screen.dart');
                List<VisitedWithLocation> locations =
                    snapshot.data as List<VisitedWithLocation>;
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return visitedList(locations: locations);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }

  Widget visitedList({required List<VisitedWithLocation> locations}) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: locations.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(locations[i]);
        });
  }

  Widget _buildRow(VisitedWithLocation loc) {
    return Card(
        child: ListTile(
      title: Text(
        loc.location.name.toString(),
        style: const TextStyle(fontSize: 18.0),
      ),
      onTap: () {},
    ));
  }
}
