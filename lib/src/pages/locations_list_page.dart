import 'package:flutter/material.dart';

import '../settings/settings_view.dart';
import '../database/database_helper.dart';
import 'location_detail_page/main.dart';
import '../widgets/downloader_modal.dart';
import '../database/tables/location.dart';
import '../widgets/locations_list.dart';

class LocationListView extends StatefulWidget {
  const LocationListView({Key? key, required this.regionId, required this.year})
      : super(key: key);
  final int regionId;
  final int year;
  static const routeName = '/all';

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

/// Displays a list of SampleItems.
class _LocationListViewState extends State<LocationListView> {
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
        appBar: AppBar(
          title: const Text('Noe Card Locations'),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () {
                // Navigator.of(context, rootNavigator: true).restorablePushNamed(Downloader.routeName);
                Navigator.restorablePushNamed(context, Downloader.routeName);
              },
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                // Navigate to the settings page. If the user leaves and returns
                // to the app after it has been killed while running in the
                // background, the navigation stack is restored.
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),

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
                return LocationsList(locations: snapshot.data);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }
}
