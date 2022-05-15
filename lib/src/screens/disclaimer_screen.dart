import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../localization/app_localizations_context.dart';

import '../settings/settings_controller.dart';
import '../settings/settings_service.dart';

class DisclaimerScreen extends StatelessWidget {
  const DisclaimerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Expanded(
          child: Text(context.loc.disclaimer),
        ),
        Row(
          children: [
            ElevatedButton(
                onPressed: () {
                  SettingsController sc = SettingsController(SettingsService());
                  sc.updateDisclaimer(1);
                },
                child: Text(context.loc.disclaimerButtonAgree)),
            ElevatedButton(
                onPressed: () {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                },
                child: Text(context.loc.cancel))
          ],
        )
      ],
    );
  }
}
