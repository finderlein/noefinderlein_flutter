import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';
import '../../../l10n/app_localizations_context.dart';

class PropertiesSection extends StatefulWidget {
  const PropertiesSection({Key? key, required this.location}) : super(key: key);
  final Location location;

  @override
  State<PropertiesSection> createState() => PropertiesSectionState();
}

class PropertiesSectionState extends State<PropertiesSection> {
  bool _open = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 5, bottom: 5),
        child: InkWell(
            onTap: () {
              setState(() {
                if (_open) {
                  _open = false;
                } else {
                  _open = true;
                }
              });
            },
            child: _open
                ? SizedBox(
                    width: double.infinity,
                    child:
                        Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                      if (widget.location.badWeather)
                        ListTile(
                          leading: Icon(MdiIcons.weatherRainy,
                              color: Theme.of(context).colorScheme.onSurface),
                          title: Text(context.loc.badWeather),
                        ),
                      if (widget.location.childFriendly)
                        ListTile(
                          leading: Icon(MdiIcons.humanMaleChild,
                              color: Theme.of(context).colorScheme.onSurface),
                          title: Text(context.loc.childFriendly),
                        ),
                      if (widget.location.strollerFriendly)
                        ListTile(
                          leading: Icon(MdiIcons.babyCarriage,
                              color: Theme.of(context).colorScheme.onSurface),
                          title: Text(context.loc.strollerFriendly),
                        ),
                      if (widget.location.dogAllowed)
                        ListTile(
                          leading: Icon(MdiIcons.dogSide,
                              color: Theme.of(context).colorScheme.onSurface),
                          title: Text(context.loc.dogAllowed),
                        ),
                      if (widget.location.wheelchairFriendly)
                        ListTile(
                          leading: Icon(MdiIcons.wheelchairAccessibility,
                              color: Theme.of(context).colorScheme.onSurface),
                          title: Text(context.loc.wheelchairFriendly),
                        ),
                      if (widget.location.tavernNear)
                        ListTile(
                          leading: Icon(MdiIcons.food,
                              color: Theme.of(context).colorScheme.onSurface),
                          title: Text(context.loc.tavernNear),
                        ),
                      if (widget.location.groupsAccepted)
                        ListTile(
                          leading: Icon(MdiIcons.accountGroup,
                              color: Theme.of(context).colorScheme.onSurface),
                          title: Text(context.loc.groupsAccepted),
                        ),
                      if (widget.location.openInWinter)
                        ListTile(
                          leading: Icon(
                            MdiIcons.weatherSnowyHeavy,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          title: Text(context.loc.openInWinter),
                        ),
                      if (widget.location.topLocation)
                        ListTile(
                          leading: Image.asset(
                              'assets/images/top_ausflugsziel.png',
                              height: 24,
                              width: 24),
                          title: Text(context.loc.topLocation),
                        ),
                    ]))
                : SizedBox(
                    width: double.infinity,
                    height: 50,
                    child:
                        Wrap(alignment: WrapAlignment.spaceEvenly, children: [
                      if (widget.location.badWeather)
                        Icon(
                          MdiIcons.weatherRainy,
                          color: Theme.of(context).colorScheme.onSurface,
                          size: 50,
                        ),
                      if (widget.location.childFriendly)
                        Icon(MdiIcons.humanMaleChild,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 50),
                      if (widget.location.strollerFriendly)
                        Icon(MdiIcons.babyCarriage,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 50),
                      if (widget.location.dogAllowed)
                        Icon(MdiIcons.dogSide,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 50),
                      if (widget.location.wheelchairFriendly)
                        Icon(MdiIcons.wheelchairAccessibility,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 50),
                      if (widget.location.tavernNear)
                        Icon(MdiIcons.food,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 50),
                      if (widget.location.groupsAccepted)
                        Icon(MdiIcons.accountGroup,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 50),
                      if (widget.location.openInWinter)
                        Icon(MdiIcons.weatherSnowyHeavy,
                            color: Theme.of(context).colorScheme.onSurface,
                            size: 50),
                      if (widget.location.topLocation)
                        Image.asset('assets/images/top_ausflugsziel.png',
                            height: 50, width: 50)
                    ]))));
  }
}
