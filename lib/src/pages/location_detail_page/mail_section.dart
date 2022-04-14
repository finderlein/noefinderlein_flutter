import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';

class MailSection extends StatelessWidget {
  const MailSection({Key? key, required this.location, this.onPressed})
      : super(key: key);

  final VoidCallback? onPressed;
  final Location location;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Icon(
                MdiIcons.email,
                size: 40.0,
                color: Theme.of(context).colorScheme.secondary,
              )),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(location.email),
          ])
        ]));
  }
}
