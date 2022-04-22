import 'package:flutter/material.dart';

import '../database/database_helper.dart';
// import './location_detail_page.dart';
import '../database/tables/location.dart';
import '../widgets/location_list/locations_list.dart';
import '../widgets/drawer_main.dart';
import '../widgets/app_bar_main.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen(
      {Key? key, required this.regionId, required this.year})
      : super(key: key);
  final int regionId;
  final int year;
  static const routeName = '/all';

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

/// Displays a list of SampleItems.
class _LocationListScreenState extends State<LocationListScreen> {
  late Future<List<Location>> _allmenuLocations;
  @override
  void initState() {
    super.initState();

    _allmenuLocations = DatabaseHelper.getAllMenuLocations(
        year: widget.year, regionId: widget.regionId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMain(year: widget.year),
        appBar: AppBarMain(customTitle: 'Alle Ziele'),

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: FutureBuilder(
          future: _allmenuLocations,
          builder:
              (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return LocationsList(locations: snapshot.data!);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }
}
