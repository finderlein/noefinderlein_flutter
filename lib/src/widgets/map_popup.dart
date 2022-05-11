import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
import 'package:noefinderlein_flutter/src/screens/location_detail_screen.dart';

// import '../database/tables/location.dart';
import '../model/model_marker_with_location.dart';

import '../localization/app_localizations_context.dart';
// import '../screens/map_screen.dart';

class MapPopup extends StatefulWidget {
  const MapPopup(this.marker, {Key? key}) : super(key: key);

  final MarkerLocation marker;

  @override
  State<StatefulWidget> createState() => _MapPopupState();
}

class _MapPopupState extends State<MapPopup> {
  _MapPopupState();
  @override
  Widget build(BuildContext context) {
    return Card(
        color: Theme.of(context).colorScheme.secondary,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                widget.marker.location.name,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 20,
                    color: Theme.of(context).colorScheme.onSecondary),
              ),
              const SizedBox(
                height: 10,
              ),
              Wrap(
                  alignment: WrapAlignment.spaceEvenly,
                  spacing: 20,
                  children: [
                    Column(
                      children: [
                        Text(
                          widget.marker.location.addressStreet,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                        Text(
                          '${widget.marker.location.addressZip} ${widget.marker.location.addressCity}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 12,
                              color: Theme.of(context).colorScheme.onSecondary),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              Navigator.restorablePushNamed(
                                  context, LocationDetailsScreen.routeName,
                                  arguments: {
                                    'locationId': widget.marker.location.id
                                  });
                            },
                            child: Text(context.loc.readon))
                      ],
                    )
                  ]),
            ],
          ),
        ));
  }
}
