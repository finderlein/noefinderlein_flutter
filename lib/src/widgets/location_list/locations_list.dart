import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import '../../model/model_location_with_open.dart';
import 'locations_list_item.dart';
// import '../../database/tables/location.dart';
import '../../screens/location_detail_screen.dart';
import '../../localization/app_localizations_context.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({Key? key, required this.locations}) : super(key: key);

  final List<LocationWithOpen> locations;

  @override
  Widget build(BuildContext context) {
    developer.log('locationlist:',
        name: 'location_list.dart', error: locations.length);
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: locations.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, position) {
          final item = locations[position];
          return Semantics(
              label: item.location.name,
              button: true,
              onTapHint: context.loc.locationListOnTapHint,
              child: InkWell(
                  onTap: () {
                    var id = item.location.id;
                    Navigator.restorablePushNamed(
                        context, LocationDetailsScreen.routeName,
                        arguments: {'locationId': id, 'date': item.date});
                  },
                  child: LocationsListItem(
                    locationWo: item,
                  )));
        });
  }
}
