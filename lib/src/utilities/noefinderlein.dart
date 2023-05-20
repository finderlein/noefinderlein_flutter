import 'dart:io';
// import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:noefinderlein_flutter/src/settings/settings_controller.dart';
import 'package:path_provider/path_provider.dart';

class Noefinderlein {
  static final Noefinderlein _instance = Noefinderlein._internal();

  // passes the instantiation to the _instance object
  factory Noefinderlein({SettingsController? settingsController}) => _instance;

  late SettingsController settingsController;
  late Directory supportDir;
  late int year;
  bool downloaderRan = false;

  //initialize variables in here
  Noefinderlein._internal() {
    DateTime nowDate = DateTime.now();
    int yearCalc = nowDate.year;
    if (nowDate.month < 4) {
      yearCalc--;
    }
    year = yearCalc;
    // supportDir
    // settingsController =
  }

  init() async {
    supportDir =
        await getApplicationSupportDirectory(); // path_provider package
  }

  String getDirectory() {
    return supportDir.path;
  }

  // bool getDark() {
  //   return settingsController.themeMode;
  // }
}
