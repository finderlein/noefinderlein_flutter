import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/locations_list_screen.dart';
import '../screens/regions_list_screen.dart';
import '../screens/settings_screen.dart';
import '../model/model_location_list.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({Key? key, required this.year}) : super(key: key);

  final int year;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
        ),
        child: ListView(children: [
          Image.asset('assets/images/finderlein_funktionsgraphik.png'),
          Text('Jahr xxxx/yyyy')
        ]),
      ),
      ListTile(
        leading: const Icon(MdiIcons.infinity),
        title: const Text('Alle Ziele'),
        onTap: () {
          LocationListScreenCall llc = LocationListScreenCall(year, 0);
          Navigator.pop(context);
          Navigator.restorablePushNamed(context, LocationListScreen.routeName,
              arguments: llc);
        },
      ),
      ListTile(
        leading: const Icon(MdiIcons.imageFilterHdr),
        title: const Text('Regionen'),
        onTap: () {
          Navigator.pop(context);
          Navigator.restorablePushNamed(context, RegionsListScreen.routeName);
        },
      ),
      ListTile(
        leading: const Icon(MdiIcons.star),
        title: const Text('Favoriten'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(MdiIcons.check),
        title: const Text('Besichtigte'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: const Icon(MdiIcons.navigation),
        title: const Text('In der Nähe'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
        },
      ),
      const Divider(),
      ListTile(
        leading: const Icon(MdiIcons.cog),
        title: const Text('Einstellungen'),
        onTap: () {
          // Update the state of the app.
          // ...
          Navigator.pop(context);
          Navigator.restorablePushNamed(context, SettingsScreen.routeName);
        },
      ),
    ]));
  }
}
