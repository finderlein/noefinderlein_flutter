import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'model/model_location_list.dart';
import 'database/tables/location.dart';
import 'screens/locations_list_screen.dart';
import 'screens/location_detail_screen.dart';
import 'settings/settings_controller.dart';
import 'screens/settings_screen.dart';
import 'screens/regions_list_screen.dart';
import './widgets/downloader_modal.dart';
import 'themes/noefinderlein.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  MyApp({
    Key? key,
    required this.settingsController,
  }) : super(key: key);

  final SettingsController settingsController;
  final NoeFinderleinTheme noefTheme = NoeFinderleinTheme();

  final int year = getCurrentYear();
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
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', null), // English, no country code
            // Locale('de', null), // German
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

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

                if (name.startsWith(LocationDetailsScreen.routeName)) {
                  final id = routeSettings.arguments as int;
                  return LocationDetailsScreen(id: id);
                }
                switch (routeSettings.name) {
                  case RegionsListScreen.routeName:
                    return RegionsListScreen(year: year);
                  case SettingsScreen.routeName:
                    return SettingsScreen(controller: settingsController);
                  case Downloader.routeName:
                    return Scaffold(
                        body: Column(children: [
                      SimpleDialog(
                          title: const Text('Downloading Data...'),
                          children: [Downloader(year: year)])
                    ]));

                  case LocationListScreen.routeName:
                  default:
                    if (routeSettings.arguments != null) {
                      final sett =
                          routeSettings.arguments as LocationListScreenCall;
                      return LocationListScreen(
                        year: sett.year,
                        regionId: sett.regionId,
                      );
                    } else {
                      return LocationListScreen(
                        year: year,
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

int getCurrentYear() {
  return 2022;
}
