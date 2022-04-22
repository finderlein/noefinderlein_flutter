import 'package:flutter/material.dart';

import 'locations_list_item.dart';
import '../../database/tables/location.dart';
import '../../screens/location_detail_screen.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({Key? key, required this.locations}) : super(key: key);

  final List<Location> locations;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemCount: locations.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: /*1*/ (BuildContext context, position) {
          final item = locations[position];
          return InkWell(
              onTap: () {
                var id = item.id;
                Navigator.restorablePushNamed(
                    context, LocationDetailsScreen.routeName,
                    arguments: id);
              },
              child: LocationsListItem(
                location: item,
              ));
        });
  }
}
