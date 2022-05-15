import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noefinderlein_flutter/src/screens/near_screen.dart';
import 'package:noefinderlein_flutter/src/screens/visited_screen.dart';

// import '../screens/cards_screen.dart';
import '../screens/about_screen.dart';
import '../screens/locations_list_screen.dart';
import '../screens/regions_list_screen.dart';
import '../screens/settings_screen.dart';

import '../utilities/noefinderlein.dart';

import '../localization/app_localizations_context.dart';

class DrawerMain extends StatelessWidget {
  const DrawerMain({Key? key, required this.year}) : super(key: key);

  final int year;
  @override
  Widget build(BuildContext context) {
    Noefinderlein glob = Noefinderlein();
    return Drawer(
        child: ListView(
            controller: ScrollController(initialScrollOffset: 0),
            padding: EdgeInsets.zero,
            children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
            child: Stack(children: [
              Column(children: [Expanded(child: funktionsGraphik(context))]),
              Column(children: [
                const Expanded(child: Center()),
                SizedBox(
                    height: 20,
                    width: double.infinity,
                    child: Text(
                      context.loc.yearDisplay(
                          glob.year.toString(), (glob.year + 1).toString()),
                      textAlign: TextAlign.end,
                    ))
              ])
            ]),
          ),
          ListTile(
            leading: const Icon(MdiIcons.infinity),
            title: Text(context.loc.drawerAllLocations),
            onTap: () {
              // LocationListScreenCall llc = LocationListScreenCall(year, 0);
              Navigator.pop(context);
              Navigator.restorablePushNamed(
                  context, LocationListScreen.routeName,
                  arguments: {'regionId': 0});
            },
          ),
          ListTile(
            leading: const Icon(MdiIcons.imageFilterHdr),
            title: Text(context.loc.drawerProvinces),
            onTap: () {
              Navigator.pop(context);
              Navigator.restorablePushNamed(
                  context, RegionsListScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(MdiIcons.star),
            title: Text(context.loc.drawerFavorits),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              Navigator.restorablePushNamed(
                  context, LocationListScreen.routeName,
                  arguments: {'regionId': 0, 'favorites': true});
            },
          ),
          ListTile(
            leading: const Icon(MdiIcons.check),
            title: Text(context.loc.drawerVisited),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              Navigator.restorablePushNamed(
                context,
                VisitedScreen.routeName,
              );
            },
          ),
          ListTile(
            leading: const Icon(MdiIcons.navigation),
            title: Text(context.loc.drawerNear),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              Navigator.restorablePushNamed(context, NearScreen.routeName);
            },
          ),
          // const Divider(),
          // ListTile(
          //   leading: const Icon(MdiIcons.cardAccountDetailsOutline),
          //   title: Text(context.loc.drawerCards),
          //   onTap: () {
          //     // Update the state of the app.
          //     // ...
          //     Navigator.pop(context);
          //     Navigator.restorablePushNamed(context, CardsScreen.routeName);
          //   },
          // ),
          const Divider(),
          ListTile(
            leading: const Icon(MdiIcons.cog),
            title: Text(context.loc.drawerSettings),
            onTap: () {
              // Update the state of the app.
              // ...
              Navigator.pop(context);
              Navigator.restorablePushNamed(context, SettingsScreen.routeName);
            },
          ),
          ListTile(
            leading: const Icon(MdiIcons.information),
            title: Text(context.loc.drawerAbout),
            onTap: () {
              Navigator.pop(context);
              Navigator.restorablePushNamed(context, AboutScreen.routeName);
            },
          ),
        ]));
  }
}

Widget funktionsGraphik(BuildContext context) {
  var brightness = Theme.of(context).brightness;
  bool isDarkMode = brightness == Brightness.dark;
  ColorFilter cf = const ColorFilter.matrix(<double>[
    0.8, 0.8, 0.9, 0, 0, //
    0.8, 0.8, 0.9, 0, 0,
    0.8, 0.8, 0.9, 0, 0,
    0, 0, 0, 1, 0,
  ]);
  if (isDarkMode) {
    return ColorFiltered(
        colorFilter: cf,
        child: Image.asset(
          'assets/images/finderlein_funktionsgraphik.png',
          fit: BoxFit.contain,
        ));
  }
  return Image.asset(
    'assets/images/finderlein_funktionsgraphik.png',
    fit: BoxFit.contain,
  );
}
