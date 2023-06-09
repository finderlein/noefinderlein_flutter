import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_map_supercluster/flutter_map_supercluster.dart';
// import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:noefinderlein_flutter/src/settings/settings_controller.dart';
import 'package:noefinderlein_flutter/src/widgets/map_popup.dart';
import 'package:permission_handler/permission_handler.dart';

import '../database/database_helper.dart';
import '../database/tables/location.dart';
import 'dart:developer' as developer;
import '../../auth/api.dart';

import '../../l10n/app_localizations_context.dart';
import '../model/model_marker_with_location.dart';

import 'package:url_launcher/url_launcher.dart';

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

/*

from https://github.com/lpongetti/flutter_map_marker_cluster/issues/115#issuecomment-1134860210
setState((){
  _markers.addAll(yourNewMarkers);
  _markers = List.from(_markers);
});

*/

/// Displays a list of SampleItems.
class _MapScreenState extends State<MapScreen> {
  late Future<List<Location>> _allmapLocations;
  late FollowOnLocationUpdate _followOnLocationUpdate;
  late StreamController<double?> _followCurrentLocationStreamController;
  late final SuperclusterImmutableController _superclusterController;

  bool locationAllowed = false;

  @override
  void initState() {
    super.initState();
    _superclusterController = SuperclusterImmutableController();
    _allmapLocations =
        DatabaseHelper.getLocationsToIds(locationIds: widget.locationIds);
    _followOnLocationUpdate = FollowOnLocationUpdate.always;
    _followCurrentLocationStreamController = StreamController<double?>();
  }

  @override
  void dispose() {
    _followCurrentLocationStreamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.loc.map),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
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
                var brightness = Theme.of(context).brightness;
                bool isDarkMode = brightness == Brightness.dark;
                List<MarkerLocation> markers = <MarkerLocation>[];
                for (Location location in snapshot.data!) {
                  markers.add(MarkerLocation(
                      point: LatLng(location.latitude, location.longitude),
                      width: 50,
                      height: 50,
                      location: location,
                      builder: (context) {
                        return Image.asset('assets/images/noe_marker.png');
                      }));
                }
                return FlutterMap(
                  options: MapOptions(
                      // nePanBoundary: LatLng(49.5752, 8.8587),
                      // swPanBoundary: LatLng(45.7823, 17.1608),
                      center: LatLng(48.193557, 15.646935),
                      zoom: 12.0,
                      maxZoom: 18,
                      // plugins: [SuperClusterPlugin()],
                      interactiveFlags:
                          InteractiveFlag.all & ~InteractiveFlag.rotate,
                      // Stop centering the location marker on the map if user interacted with the map.
                      onTap: (_, __) => _superclusterController.hideAllPopups(),
                      onPositionChanged:
                          (MapPosition position, bool hasGesture) {
                        if (hasGesture &&
                            _followOnLocationUpdate !=
                                FollowOnLocationUpdate.never) {
                          setState(
                            () => _followOnLocationUpdate =
                                FollowOnLocationUpdate.never,
                          );
                        }
                      }),
                  nonRotatedChildren: [
                    SimpleAttributionWidget(
                      // source: const Text('Datenquelle: basemap.at und openstreetmap'),
                      // onTap: () {
                      //   Uri webLaunchUri = Uri.parse('https://basemap.at');
                      //   _launchURL(webLaunchUri);
                      // },
                      source: const Text('Map data from openstreetmap'),
                      onTap: () {
                        Uri webLaunchUri =
                            Uri.parse('https://www.openstreetmap.org');
                        _launchURL(webLaunchUri);
                      },
                    ),
                    Positioned(
                      right: 20,
                      bottom: 20,
                      child: FloatingActionButton(
                        onPressed: () async {
                          if (await Permission.location.request().isGranted) {
                            if (await Permission
                                .locationWhenInUse.serviceStatus.isEnabled) {
                              // Automatically center the location marker on the map when location updated until user interact with the map.
                              setState(() {
                                locationAllowed = true;
                                _followOnLocationUpdate =
                                    FollowOnLocationUpdate.always;
                              });
                              // Follow the location marker on the map and zoom the map to level 18.
                              _followCurrentLocationStreamController.add(13);
                            } else {
                              setState(() => locationAllowed = true);
                            }
                          } else {
                            setState(() => locationAllowed = true);
                          }
                          if (await Permission.location.request().isGranted) {}
                        },
                        child: const Icon(
                          Icons.my_location,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                  children: [
                    TileLayer(
                      fallbackUrl:
                          'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                      subdomains: const ['a', 'b', 'c'],
                      tileProvider: NetworkTileProvider(),
                      userAgentPackageName: 'at.finderlein.noe',
                      urlTemplate: isDarkMode ? mapUrlDark : mapUrl,
                      // errorTileCallback: (tile, error, stackTrace) {},
                      // errorImage:
                      //     Image.asset('assets/images/lokalbahn.png').image,
                      // evictErrorTileStrategy: EvictErrorTileStrategy.dispose,
                    ),
                    if (locationAllowed)
                      CurrentLocationLayer(
                        followCurrentLocationStream:
                            _followCurrentLocationStreamController.stream,
                        followOnLocationUpdate: _followOnLocationUpdate,
                      ),
                    SuperclusterLayer.immutable(
                        controller: _superclusterController,
                        initialMarkers: markers, // Provide your own
                        clusterWidgetSize: const Size(50, 50),
                        maxClusterRadius: 200,
                        indexBuilder: IndexBuilders.rootIsolate,
                        popupOptions: PopupOptions(
                          popupDisplayOptions: PopupDisplayOptions(
                              snap: PopupSnap.markerTop,
                              builder: (_, marker) {
                                if (marker is MarkerLocation) {
                                  return MapPopup(marker);
                                }
                                return const Card(
                                    child: Text('Location not found'));
                              }),
                          // popupSnap: PopupSnap.markerTop,
                          // popupController: _popupLayerController,
                          // selectedMarkerBuilder: ,
                        ),
                        builder:
                            (context, position, markerCount, extraClusterData) {
                          return Image.asset(
                              'assets/images/noe_multimarker_active.png');
                        }),
                  ],
                );
            }
          },
        ));
  }
}

void _launchURL(url) async => await canLaunchUrl(url)
    ? await launchUrl(url, mode: LaunchMode.externalApplication)
    : throw 'Could not launch $url';

// Future<Position> _determinePosition() async {
//   bool serviceEnabled;
//   LocationPermission permission;

//   // Test if location services are enabled.
//   serviceEnabled = await Geolocator.isLocationServiceEnabled();
//   if (!serviceEnabled) {
//     // Location services are not enabled don't continue
//     // accessing the position and request users of the
//     // App to enable the location services.
//     return Future.error('Location services are disabled.');
//   }

//   permission = await Geolocator.checkPermission();
//   if (permission == LocationPermission.denied) {
//     permission = await Geolocator.requestPermission();
//     if (permission == LocationPermission.denied) {
//       // Permissions are denied, next time you could try
//       // requesting permissions again (this is also where
//       // Android's shouldShowRequestPermissionRationale
//       // returned true. According to Android guidelines
//       // your App should show an explanatory UI now.
//       return Future.error('Location permissions are denied');
//     }
//   }

//   if (permission == LocationPermission.deniedForever) {
//     // Permissions are denied forever, handle appropriately.
//     return Future.error(
//         'Location permissions are permanently denied, we cannot request permissions.');
//   }

//   // When we reach here, permissions are granted and we can
//   // continue accessing the position of the device.
//   return await Geolocator.getCurrentPosition();
// }
