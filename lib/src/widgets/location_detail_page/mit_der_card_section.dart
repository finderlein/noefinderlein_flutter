import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noefinderlein_flutter/src/widgets/location_detail_page/title_section.dart';
import '../../database/tables/location.dart';

class MitDerCardSection extends StatelessWidget {
  const MitDerCardSection({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.tertiary,
      title: Text('Mit der Card', style: TextStyle(fontSize: 18)),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(location.entryText),
        const Padding(
            padding: EdgeInsets.only(top: 10),
            child: Text('Ersparnis:', style: TextStyle(fontSize: 16))),
        Text('Erwachsenen-CARD € ${location.savingsAdult}'),
        Text('Jugend-CARD € ${location.savingsChild}'),
      ]),
      leading: Icon(
        MdiIcons.smartCardOutline,
        size: 40.0,
        color: Theme.of(context).colorScheme.onTertiary,
      ),
    );
  }
}
