import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noefinderlein_flutter/src/screens/map_screen.dart';
import 'dart:developer' as developer;
import '../database/database_helper.dart';
import '../database/tables/location.dart';
import '../widgets/location_list/locations_list.dart';
import '../widgets/drawer_main.dart';
import '../widgets/downloader_modal.dart';
import '../widgets/search_text_field.dart';
import '../utilities/noefinderlein.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen(
      {Key? key,
      required this.regionId,
      required this.year,
      this.drawer = true,
      this.favorites = false})
      : super(key: key);
  final int regionId;
  final int year;
  final bool drawer;
  final bool favorites;
  static const routeName = '/all';

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

/// Displays a list of SampleItems.
class _LocationListScreenState extends State<LocationListScreen> {
  late Future<List<Location>> _allmenuLocations;
  String customTitle = 'Alle Ziele';
  bool _search = false;
  String searchString = '';
  List<int> currentIds = [];
  Noefinderlein glob = Noefinderlein();

  @override
  void initState() {
    super.initState();

    customTitle = DatabaseHelper.getRegionName(widget.regionId);
    developer.log('regionId',
        name: 'locations_list_screen.dart', error: widget.regionId.toString());
    _allmenuLocations = DatabaseHelper.getAllLocations(
        year: widget.year,
        regionId: widget.regionId,
        favorites: widget.favorites,
        searchString: searchString);
  }

  @override
  Widget build(BuildContext context) {
    if (!glob.downloaderRan) {
      glob.downloaderRan = true;
      Future.delayed(Duration.zero, () => showDownloader(context));
    }
    return Scaffold(
        drawer: widget.drawer ? DrawerMain(year: widget.year) : null,
        appBar: AppBar(
          title: !_search
              ? Text(customTitle)
              : SearchTextField(onChanged: (value) {
                  String low = value.toLowerCase();
                  developer.log('searchbox',
                      name: 'locations_list_screen.dart', error: low);
                  setState(() {
                    _allmenuLocations = DatabaseHelper.getAllLocations(
                        year: widget.year,
                        regionId: widget.regionId,
                        favorites: widget.favorites,
                        searchString: low);
                  });
                }),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            !_search
                ? IconButton(
                    icon: const Icon(MdiIcons.magnify),
                    onPressed: () {
                      setState(() {
                        //add
                        _search = true;
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () {
                      setState(() {
                        //add
                        _search = false;
                        _allmenuLocations = DatabaseHelper.getAllLocations(
                            year: widget.year,
                            regionId: widget.regionId,
                            favorites: widget.favorites,
                            searchString: '');
                      });
                    },
                  ),
            IconButton(
              icon: const Icon(MdiIcons.sortAlphabeticalVariant),
              onPressed: () => showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                          title: const Text('Sortiere nach...?'),
                          actions: [
                            TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'bookletId'),
                                child: Text(
                                  'Nö Card Nummer',
                                  style: TextStyle(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                )),
                            TextButton(
                                onPressed: () => Navigator.pop(context, 'name'),
                                child: Text('Namen',
                                    style: TextStyle(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurface))),
                          ])).then((value) => setState(() {
                    //add

                    _allmenuLocations = DatabaseHelper.getAllLocations(
                        year: widget.year,
                        regionId: widget.regionId,
                        favorites: widget.favorites,
                        searchString: '',
                        sortBy: value);
                  })),
            ),
            IconButton(
              icon: const Icon(MdiIcons.filterOutline),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(MdiIcons.map),
              onPressed: () {
                Navigator.restorablePushNamed(context, MapScreen.routeName,
                    arguments: {'locations': currentIds});
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
                developer.log('waiting', name: 'locations_list_screen.dart');
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                developer.log('done', name: 'locations_list_screen.dart');
                if (snapshot.data != null) {
                  currentIds = genIdList(snapshot.data);
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return LocationsList(locations: snapshot.data!);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }

  void showDownloader(BuildContext context) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
            title: const Text('Downloading Data...'),
            scrollable: true,
            content: Column(children: [
              Downloader(
                year: widget.year,
                callback: () {
                  setState(() {
                    //add
                    _search = false;
                    _allmenuLocations = DatabaseHelper.getAllLocations(
                      year: widget.year,
                      regionId: widget.regionId,
                      favorites: widget.favorites,
                      searchString: searchString,
                    );
                  });
                },
              )
            ])));
  }
}

String genIdString(List<Location>? locations) {
  if (locations != null) {
    return locations.map((e) => e.id).join(',');
  } else {
    return '';
  }
}

List<int> genIdList(List<Location>? locations) {
  if (locations != null) {
    return locations.map((e) => e.id).toList();
  } else {
    return [];
  }
}
