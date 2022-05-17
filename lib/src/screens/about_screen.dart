import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../main.dart';
import '../localization/app_localizations_context.dart';

import '../settings/settings_controller.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({Key? key}) : super(key: key);

  static const routeName = '/about';
  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    double edge = 16;
    return DefaultTabController(
        length: 3,
        child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(MdiIcons.homeHeart), text: 'CREDITS'),
                  Tab(icon: Icon(MdiIcons.github), text: 'CONTRIBUTION'),
                  Tab(icon: Icon(MdiIcons.license), text: 'LICENSE'),
                ],
              ),
            ),
            body: Padding(
                padding: EdgeInsets.only(left: edge, right: edge),
                child: TabBarView(
                  children: [credits(), contribution(), license()],
                ))));
  }

  Widget credits() {
    double inst = 30;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: inst),
          child: Column(children: [
            Center(
                child: Image.asset(
              'assets/images/finderlein_logo_bunt.png',
              width: 100,
              height: 100,
            )),
            const Padding(
                padding: EdgeInsets.all(20),
                child: Center(
                    child: Text(
                  'NÖ Finderlein',
                  style: TextStyle(fontSize: 25),
                )))
          ]),
        ),
        item(
            title: 'VERSION',
            text:
                'You are currently using Version: ${packageInfo.version}, Build number: ${packageInfo.buildNumber}'),
        item(title: 'MAINTAINER', text: 'Roman Reitschmied'),
      ],
    );
  }

  Widget contribution() {
    return Column(
      children: [
        item(
            title: 'WEPBAGE',
            text:
                'Information regarding the app can be found on: https://finderlein.at',
            url: Uri(scheme: 'https', path: "finderlein.at")),
        item(
            title: 'SOURCE CODE',
            text:
                'This projects source code is hosted on GitHub: https://github.com/finderlein/noefinderlein_flutter',
            url: Uri(
                scheme: 'https',
                path: "github.com/finderlein/noefinderlein_flutter")),
        item(
            title: 'ISSUES',
            text:
                'You can report bugs, enhancement proposals and feature requests at the GitHub issue tracker: https://github.com/finderlein/noefinderlein_flutter/issues/new/choose',
            url: Uri(
                scheme: 'https',
                path:
                    "github.com/finderlein/noefinderlein_flutter/issues/new/choose")),
        // item(
        //     title: 'TRANSLATE',
        //     text:
        //         'Join the Finderlein Team on Transifex and help to translate this app: ',
        //     url: "")
      ],
    );
  }

  Widget license() {
    return ListView(children: [
      item(
          title: 'APP LICENSE',
          text:
              'This application is licensed under the GNU GENERAL PUBLIC LICENSE v3'),
      Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ElevatedButton(
              onPressed: () {
                Uri url = Uri.parse(
                    'https://github.com/finderlein/noefinderlein_flutter/blob/main/LICENSE');
                _launchURL(url);
              },
              child: const Text('VIEW LICENSE'))),
      item(
          title: 'ICONS',
          text:
              'This projects uses Material Design Icons from: https://github.com/Templarian/MaterialDesign',
          url: Uri.parse("https://github.com/Templarian/MaterialDesign")),
      item(
        title: 'LIBRARIES',
        text:
            'This projects uses the following libraries as found on https://pub.dev',
      ),
      ...[
        "package_info_plus",
        "flutter_localizations",
        'isar',
        'isar_flutter_libs',
        'path_provider',
        'path',
        'http',
        'material_design_icons_flutter',
        'url_launcher',
        'maps_launcher',
        'flutter_map',
        'flutter_map_marker_cluster',
        'flutter_map_location_marker',
        'latlong2',
        'shared_preferences',
        'geolocator',
        'intl',
        'flutter_lints',
        'isar_generator',
        'build_runner',
        'analyzer'
      ]
          .map((e) => InkWell(
              onTap: () {
                Uri url = Uri.parse('https://pub.dev/packages/$e');
                _launchURL(url);
              },
              child: Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: Text(e, style: const TextStyle(fontSize: 15)))))
          .toList()
    ]);
  }

  Widget item({required String title, required String text, Uri? url}) {
    return Padding(
        padding: const EdgeInsets.only(top: 20),
        child: InkWell(
            onTap: () {
              if (url != null) {
                _launchURL(url);
              }
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                const Divider(),
                Text(text)
              ],
            )));
  }
}

void _launchURL(url) async => await canLaunchUrl(url)
    ? await launchUrl(url)
    : throw 'Could not launch $url';
