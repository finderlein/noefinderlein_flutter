import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'database/tables/location.dart';
import 'pages/locations_list_page.dart';
import 'pages/location_detail_page/main.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
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
          restorationScopeId: 'app',

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

                if (name.startsWith(LocationDetailsPage.routeName)) {
                  final id = routeSettings.arguments as int;
                  return LocationDetailsPage(id: id);
                }
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case Downloader.routeName:
                    return Scaffold(
                        body: Column(children: const [
                      SimpleDialog(
                          title: Text('Downloading Data...'),
                          children: [Downloader(year: 2022)])
                    ]));

                  case LocationListView.routeName:
                  default:
                    return const LocationListView(
                      year: 2022,
                      regionId: 1,
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
