import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
// import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong2/latlong.dart';
import 'package:noefinderlein_flutter/src/settings/settings_controller.dart';
import 'package:noefinderlein_flutter/src/widgets/app_bar_main.dart';

import '../database/database_helper.dart';
import '../database/tables/location.dart';
import 'dart:developer' as developer;
import '../../auth/secrets.dart';

class MapScreen extends StatefulWidget {
  const MapScreen(
      {Key? key, required this.locationIds, required this.settingsController})
      : super(key: key);
  // final String locationIds;
  final List<int> locationIds;
  final SettingsController settingsController;
  static const routeName = '/map';

  @override
  State<MapScreen> createState() => _MapScreenState();
}

/// Displays a list of SampleItems.
class _MapScreenState extends State<MapScreen> {
  late Future<List<Location>> _allmapLocations;

  @override
  void initState() {
    super.initState();
    _allmapLocations =
        DatabaseHelper.getLocationsToIds(locationIds: widget.locationIds);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarMain(
          customTitle: 'Items',
        ),
        body: FutureBuilder(
          future: _allmapLocations,
          builder:
              (BuildContext context, AsyncSnapshot<List<Location>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                developer.log('waiting', name: 'map_screen.dart');
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                developer.log('done', name: 'map_screen.dart');
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return LocationsMap(locations: snapshot.data!);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }
}

class LocationsMap extends StatelessWidget {
  const LocationsMap({Key? key, required this.locations}) : super(key: key);

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    var brightness = Theme.of(context).brightness;
    bool isDarkMode = brightness == Brightness.dark;
    List<Marker> markers = <Marker>[];
    for (Location element in locations) {
      markers.add(Marker(
          point: LatLng(element.latitude, element.longitude),
          width: 50,
          height: 50,
          builder: (context) {
            return Image.asset('assets/images/noe_marker.png');
          }));
    }
    return FlutterMap(
      options: MapOptions(
          center: LatLng(48.193557, 15.646935),
          zoom: 12.0,
          plugins: [MarkerClusterPlugin()]),
      children: [
        TileLayerWidget(
            options: TileLayerOptions(
          urlTemplate: isDarkMode ? mapUrlDark : mapUrl,
          additionalOptions: {
            'accessToken': mapAccessToken,
            'id': 'mapbox.streets',
          },
        )),
        MarkerClusterLayerWidget(
            options: MarkerClusterLayerOptions(
                maxClusterRadius: 120,
                size: const Size(50, 50),
                fitBoundsOptions: const FitBoundsOptions(
                  padding: EdgeInsets.all(50),
                ),
                markers: markers,
                polygonOptions: PolygonOptions(
                    borderColor: Theme.of(context).colorScheme.secondary,
                    color: Colors.black12,
                    borderStrokeWidth: 3),
                builder: (BuildContext context, List<Marker> markers) {
                  return Image.asset(
                      'assets/images/noe_multimarker_active.png');
                })),
        // LocationMarkerLayerWidget()
      ],
    );
  }
}
