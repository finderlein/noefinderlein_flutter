// import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../model/model_location_with_position.dart';
import '../../utilities/category_icon.dart';

class LocationsNearListItem extends StatelessWidget {
  const LocationsNearListItem({Key? key, required this.location})
      : super(key: key);

  final LocationWithPosition location;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(location.lwo.location.name),
        subtitle: Row(children: [
          CategoryIcon(category: location.lwo.location.category),
          Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text(location.lwo.location.addressCity))
        ]),
        trailing: Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Column(children: [
              Text(location.distanceWithUnit),
              // Transform.rotate(
              //     angle: location.bearing.toDouble(),
              //     child: Icon(MdiIcons.navigation))
            ])),
      ),
    );
  }
}
