import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// A service that stores and retrieves user settings.
///
/// By default, this class does not persist user settings. If you'd like to
/// persist the user settings locally, use the shared_preferences package. If
/// you'd like to store settings on a web server, use the http package.
class SettingsService {
  /// Loads the User's preferred ThemeMode from local or remote storage.
  Future<ThemeMode> themeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final int? theme = prefs.getInt('theme');
    if (theme != null) {
      for (var element in ThemeMode.values) {
        if (element.index == theme) {
          return element;
        }
      }
    }
    return ThemeMode.system;
  }
  Future<bool> migrationDone() async {
    final prefs = await SharedPreferences.getInstance();
    final bool? migrationDone = prefs.getBool('migrationDone');
    if (migrationDone != null) {
      return migrationDone;
    }
    return false;
  }
  /// Persists the user's preferred ThemeMode to local or remote storage.
  Future<void> updateThemeMode(ThemeMode theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('theme', theme.index);
    // Use the shared_preferences package to persist settings locally or the
    // http package to persist settings over the network.
  }

  Future<void> updateMigrationDone(bool migrationDone) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('migrationDone', migrationDone);
  }
}
