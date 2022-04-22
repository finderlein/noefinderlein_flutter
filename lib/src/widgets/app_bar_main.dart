import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../screens/locations_list_screen.dart';
import '../screens/settings_screen.dart';

import './downloader_modal.dart';

class AppBarMain extends StatelessWidget implements PreferredSizeWidget {
  const AppBarMain({Key? key, required this.customTitle}) : super(key: key);

  final String customTitle;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(customTitle),
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      actions: [
        IconButton(
          icon: const Icon(Icons.download),
          onPressed: () {
            // Navigator.of(context, rootNavigator: true).restorablePushNamed(Downloader.routeName);
            Navigator.restorablePushNamed(context, Downloader.routeName);
          },
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
