import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import '../../model/model_location_with_position.dart';
import '../../screens/location_detail_screen.dart';
import 'locations_near_list_item.dart';

class LocationsNearList extends StatelessWidget {
  const LocationsNearList({Key? key, required this.locations})
      : super(key: key);

  final List<LocationWithPosition> locations;

  @override
  Widget build(BuildContext context) {
    developer.log('locationnearlist:',
        name: 'locations_near_list.dart', error: locations.length);
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: locations.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, position) {
          final item = locations[position];
          return InkWell(
              onTap: () {
                var id = item.location.id;
                Navigator.restorablePushNamed(
                    context, LocationDetailsScreen.routeName,
                    arguments: id);
              },
              child: LocationsNearListItem(
                location: item,
              ));
        });
  }
}
