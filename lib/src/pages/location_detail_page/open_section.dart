import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';

class OpenSection extends StatelessWidget {
  const OpenSection({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Icon(
            MdiIcons.clockOutline,
            size: 40.0,
            color: Theme.of(context).colorScheme.secondary,
          )),
      Expanded(
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text(location.openText)]))
    ]);
  }
}
