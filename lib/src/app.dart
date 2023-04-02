// import 'dart:ffi';
import 'dart:developer' as developer;
// import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:noefinderlein_flutter/src/screens/about_screen.dart';
// import 'package:noefinderlein_flutter/src/screens/cards_screen.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:noefinderlein_flutter/src/screens/map_screen.dart';
import 'package:noefinderlein_flutter/src/screens/near_screen.dart';
import 'package:noefinderlein_flutter/src/screens/visited_screen.dart';

// import 'database/tables/location.dart';
import 'screens/disclaimer_screen.dart';
import 'screens/locations_list_screen.dart';
import 'screens/location_detail_screen.dart';
import 'settings/settings_controller.dart';
import 'screens/settings_screen.dart';
import 'screens/regions_list_screen.dart';
// import './widgets/downloader_modal.dart';
import 'themes/noefinderlein.dart';
import 'utilities/noefinderlein.dart';

// import './localization/app_localizations_context.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;
  final NoeFinderleinTheme noefTheme = NoeFinderleinTheme();
  final Noefinderlein glob = Noefinderlein();

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    //
    // The AnimatedBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return AnimatedBuilder(
      animation: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'noefindeleinApp',

          initialRoute: LocationListScreen.routeName,
          // routes: {
          //   // LocationListScreen.routeName: (BuildContext context) =>
          //   //     const LocationListScreen(),
          //   RegionsListScreen.routeName: (BuildContext context) =>
          //       RegionsListScreen(year: year),
          //   SettingsScreen.routeName: (BuildContext context) =>
          //       SettingsScreen(controller: settingsController)
          // },
          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          // localizationsDelegates: const [
          //   AppLocalizations.delegate,
          //   GlobalMaterialLocalizations.delegate,
          //   GlobalWidgetsLocalizations.delegate,
          //   GlobalCupertinoLocalizations.delegate,
          // ],
          supportedLocales: AppLocalizations.supportedLocales,
          // supportedLocales: const [
          //   Locale('en'), // English, no country code
          //   Locale('de'), // German
          // ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context).appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: noefTheme.get(isDark: false),
          darkTheme: noefTheme.get(isDark: true),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                final String name = routeSettings.name as String;
                if (!settingsController.disclaimerRead) {
                  return DisclaimerScreen(
                      settingsController: settingsController);
                }

                if (name.startsWith(LocationDetailsScreen.routeName)) {
                  final arguments = routeSettings.arguments as Map;
                  int locationId = arguments['locationId'];
                  DateTime? date = arguments['date'];
                  return LocationDetailsScreen(id: locationId, date: date);
                }
                developer.log('routeName',
                    name: 'app.dart', error: routeSettings.name);
                switch (routeSettings.name) {
                  // case CardsScreen.routeName:
                  //   return const CardsScreen();
                  case AboutScreen.routeName:
                    return const AboutScreen();
                  case RegionsListScreen.routeName:
                    return RegionsListScreen(year: glob.year);
                  case SettingsScreen.routeName:
                    return SettingsScreen(controller: settingsController);
                  // case Downloader.routeName:
                  //   return Scaffold(
                  //       body: Column(children: [
                  //     SimpleDialog(
                  //         title: const Text('Downloading Data...'),
                  //         children: [Downloader(year: glob.year, callback: () {

                  //         },)])
                  //   ]));
                  case MapScreen.routeName:
                    final arguments = routeSettings.arguments as Map;
                    var locationIds = arguments['locations'];

                    return MapScreen(
                        locationIds: locationIds,
                        settingsController: settingsController);
                  case NearScreen.routeName:
                    return NearScreen(year: glob.year);
                  case VisitedScreen.routeName:
                    return VisitedScreen(year: glob.year);
                  case '/':
                  case LocationListScreen.routeName:
                  default:
                    if (routeSettings.arguments != null) {
                      final arguments = routeSettings.arguments as Map;
                      int regionId = arguments['regionId'];
                      bool drawer = arguments['drawer'] ?? true;
                      bool favorites = arguments['favorites'] ?? false;
                      developer.log('regionId',
                          name: 'app.dart', error: regionId.toString());
                      return LocationListScreen(
                          year: glob.year,
                          regionId: regionId,
                          drawer: drawer,
                          favorites: favorites);
                    } else {
                      return LocationListScreen(
                        year: glob.year,
                        regionId: 0,
                      );
                    }
                }
              },
            );
          },
        );
      },
    );
  }
}
