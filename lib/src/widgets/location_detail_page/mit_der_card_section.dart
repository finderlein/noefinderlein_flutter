import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:noefinderlein_flutter/src/widgets/location_detail_page/title_section.dart';
import '../../database/tables/location.dart';

import '../../localization/app_localizations_context.dart';

class MitDerCardSection extends StatelessWidget {
  const MitDerCardSection({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Theme.of(context).colorScheme.tertiary,
      title: Text(context.loc.includedInCard,
          style: const TextStyle(fontSize: 18)),
      subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(location.entryText),
        Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text('${context.loc.savings}:',
                style: const TextStyle(fontSize: 16))),
        Text('${context.loc.adultCard} € ${location.savingsAdult}'),
        Text('${context.loc.childCard} € ${location.savingsChild}'),
      ]),
      leading: Icon(
        MdiIcons.smartCardOutline,
        size: 40.0,
        color: Theme.of(context).colorScheme.onTertiary,
      ),
    );
  }
}
