import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../main.dart';
import '../localization/app_localizations_context.dart';

import '../settings/settings_controller.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({Key? key, required this.settingsController})
      : super(key: key);

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(20),
      child: Column(children: [
        Expanded(
          child: Center(
              child: Wrap(alignment: WrapAlignment.spaceAround, children: [
            Text(context.loc.disclaimer),
            Container(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  settingsController.updateDisclaimer(2);
                  RestartWidget.restartApp(context);
                },
                child: Text(context.loc.disclaimerButtonAgree)),
            ElevatedButton(
                onPressed: () {
                  Future.delayed(const Duration(milliseconds: 1000), () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  });
                },
                child: Text(context.loc.cancel))
          ])),
        )
      ]),
    ));
  }
}
