import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:noefinderlein_flutter/src/widgets/locations_near_list/locations_near_list.dart';
import 'dart:io' show Platform;
import 'dart:developer' as developer;
import 'dart:async';

import '../database/database_helper.dart';
import '../model/model_location_with_position.dart';
import '../model/model_position_item.dart';
import '../utilities/get_position.dart';
import '../widgets/drawer_main.dart';
import '../localization/app_localizations_context.dart';

class NearScreen extends StatefulWidget {
  const NearScreen({
    Key? key,
    required this.year,
  }) : super(key: key);
  final int year;
  static const routeName = '/near';

  @override
  State<NearScreen> createState() => _NearScreenState();
}

class _NearScreenState extends State<NearScreen> {
  late Future<List<LocationWithPosition>> _allNearLocations;
  late GetPosition gp = GetPosition(callback: callback);

  // StreamSubscription<Position>? _positionStreamSubscription;
  // StreamSubscription<ServiceStatus>? _serviceStatusStreamSubscription;
  // bool positionStreamStarted = false;

  @override
  void initState() {
    super.initState();
    // _toggleServiceStatusStream();
    gp.getLastKnownPosition();
    _allNearLocations = DatabaseHelper.getAllNearLocations(
        year: widget.year, positions: gp.positionList);
  }

  PopupMenuButton _createActions() {
    return PopupMenuButton(
      elevation: 40,
      onSelected: (value) async {
        switch (value) {
          case 1:
            gp.getLocationAccuracy();
            break;
          case 2:
            gp.requestTemporaryFullAccuracy();
            break;
          case 3:
            gp.openAppSettings();
            break;
          case 4:
            gp.openLocationSettings();
            break;
          case 5:
            // setState(() {
            //   positionItems.clear;
            //   positionList.clear;
            // });
            setState(gp.positionItems.clear);
            setState(gp.positionList.clear);
            break;
          default:
            break;
        }
      },
      itemBuilder: (context) => [
        if (Platform.isIOS)
          PopupMenuItem(
            value: 1,
            child: Text(context.loc.getLocAcc),
          ),
        if (Platform.isIOS)
          PopupMenuItem(
            value: 2,
            child: Text(context.loc.reqTempFullAcc),
          ),
        if (!Platform.isLinux)
          PopupMenuItem(
            value: 3,
            child: Text(context.loc.openAppSettings),
          ),
        if (Platform.isAndroid || Platform.isWindows)
          PopupMenuItem(
            value: 4,
            child: Text(context.loc.openLocationSettings),
          ),
        PopupMenuItem(
          value: 5,
          child: Text(context.loc.textClear),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMain(year: widget.year),
        appBar: AppBar(
          title: Text(context.loc.nearScreenTitle),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            // IconButton(
            //   icon: const Icon(MdiIcons.crosshairsGps),
            //   onPressed: () async {
            //     await _getCurrentPosition();
            //   },
            // ),
            _createActions()
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await gp.getCurrentPosition();
          },
          child: const Icon(MdiIcons.crosshairsGps),
        ),
        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: FutureBuilder(
          future: _allNearLocations,
          builder: (BuildContext context,
              AsyncSnapshot<List<LocationWithPosition>> snapshot) {
            developer.log('connectionState',
                name: 'locations_list_screen.dart',
                error: snapshot.connectionState);
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.waiting:
                developer.log('waiting', name: 'locations_list_screen.dart');
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                developer.log('done', name: 'locations_list_screen.dart');
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (snapshot.data != null) {
                  List<LocationWithPosition> locations =
                      snapshot.data as List<LocationWithPosition>;
                  if (locations.isNotEmpty) {
                    return LocationsNearList(locations: locations);
                  } else {
                    String log = '';
                    for (PositionItem pi in gp.positionItems) {
                      if (pi.displayValue != null && pi.displayValue != '') {
                        log += '${pi.displayValue!}\n';
                      }
                    }
                    return Center(
                        child: Text(context.loc.positionNotFound(log)));
                  }
                }
                return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }

  void callback() {
    setState(() {
      _allNearLocations = DatabaseHelper.getAllNearLocations(
          year: widget.year, positions: gp.positionList);
    });
  }
}
