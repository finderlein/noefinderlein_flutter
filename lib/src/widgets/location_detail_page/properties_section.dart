import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';

class PropertiesSection extends StatelessWidget {
  const PropertiesSection({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: double.infinity,
        child: Wrap(alignment: WrapAlignment.spaceEvenly, children: [
          if (location.badWeather)
            Icon(MdiIcons.weatherRainy,
                color: Theme.of(context).colorScheme.onSurface),
          if (location.childFriendly)
            Icon(MdiIcons.humanMaleChild,
                color: Theme.of(context).colorScheme.onSurface),
          if (location.strollerFriendly)
            Icon(MdiIcons.babyCarriage,
                color: Theme.of(context).colorScheme.onSurface),
          if (location.dogAllowed)
            Icon(MdiIcons.dogSide,
                color: Theme.of(context).colorScheme.onSurface),
          if (location.wheelchairFriendly)
            Icon(MdiIcons.wheelchairAccessibility,
                color: Theme.of(context).colorScheme.onSurface),
          if (location.tavernNear)
            Icon(MdiIcons.food, color: Theme.of(context).colorScheme.onSurface),
          if (location.groupsAccepted)
            Icon(MdiIcons.accountGroup,
                color: Theme.of(context).colorScheme.onSurface),
          if (location.openInWinter)
            Icon(MdiIcons.weatherSnowyHeavy,
                color: Theme.of(context).colorScheme.onSurface),
          if (location.topLocation)
            Image.asset('assets/images/top_ausflugsziel.png',
                height: 24, width: 24)
        ]));
  }
}
