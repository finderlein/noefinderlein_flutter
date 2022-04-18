import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';

class MitDerCardSection extends StatelessWidget {
  const MitDerCardSection({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
        ),
        child: Row(children: [
          Padding(
              padding: const EdgeInsets.only(right: 16, left: 10),
              child: Icon(
                MdiIcons.smartCardOutline,
                size: 40.0,
                color: Theme.of(context).colorScheme.onTertiary,
              )),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const Text('Mit der Card', style: TextStyle(fontSize: 18)),
            Text(location.entryText),
            const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text('Ersparnis:', style: TextStyle(fontSize: 16))),
            Text('Erwachsenen-CARD € ${location.savingsAdult}'),
            Text('Jugend-CARD € ${location.savingsChild}'),
          ])
        ]));
  }
}
