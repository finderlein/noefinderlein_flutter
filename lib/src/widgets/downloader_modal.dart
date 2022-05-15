import 'package:flutter/material.dart';
// import 'package:noefinderlein_flutter/src/screens/locations_list_screen.dart';
import '../utilities/data_downloader.dart';
// import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
// import '../pages/locations_list_page.dart';
import '../model/model_downloader_progress.dart';
import 'dart:developer' as developer;

import '../localization/app_localizations_context.dart';

class Downloader extends StatefulWidget {
  const Downloader({Key? key, required this.year}) : super(key: key);
  final int year;
  static const routeName = '/downloader';

  @override
  State<Downloader> createState() => DownloaderState();
}

class DownloaderState extends State<Downloader> {
  DataDownloader dd = DataDownloader();

  DownloaderProgress dp = DownloaderProgress();

  @override
  void initState() {
    super.initState();
    dp.current = 0;
    dp.max = 400;
    dp.dcurrent = 0;
    dp.dmax = 100;
    dp.region = false;
    dp.province = false;
    dp.category = false;
  }

  @override
  Widget build(BuildContext context) {
    DownloaderProgressNull initial = DownloaderProgressNull();
    initial.current = dp.current;
    initial.max = dp.max;
    initial.dcurrent = dp.dcurrent;
    initial.dmax = dp.dmax;
    final sb = StreamBuilder(
      stream: dd.refresh(widget.year),
      initialData: initial,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
          case ConnectionState.waiting:
          case ConnectionState.active:
          case ConnectionState.done:
            DownloaderProgressNull d = snapshot.data as DownloaderProgressNull;

            if (d.current != null) {
              dp.current = d.current!;
            }
            if (d.max != null) {
              dp.max = d.max!;
            }
            if (d.dcurrent != null) {
              dp.dcurrent = d.dcurrent!;
            }
            if (d.dmax != null) {
              dp.dmax = d.dmax!;
            }
            if (d.region != null) {
              dp.region = d.region!;
            }
            if (d.province != null) {
              dp.province = d.province!;
            }
            if (d.category != null) {
              dp.category = d.category!;
            }

            if (snapshot.connectionState == ConnectionState.done) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                // Navigator.popUntil(
                //     context, ModalRoute.withName(LocationListScreen.routeName));
                Navigator.pop(context);
              });
              if (d.error != '') {
                developer.log('error',
                    name: 'downloader_modal.dart', error: d.error);
                developer.log('connectionState',
                    name: 'downloader_modal.dart',
                    error: snapshot.connectionState);
                Future.microtask(() {
                  final snackBar = SnackBar(
                    backgroundColor: Theme.of(context).colorScheme.error,
                    content: Text(
                      context.loc.downloadError(d.error),
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.onError),
                    ),
                  );

                  // Find the ScaffoldMessenger in the widget tree
                  // and use it to show a SnackBar.
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                });
              }
            }
            return ProgressBars(barData: dp);
        }
        // return Container(); // unreachable
      },
    );

    return sb;
  }
}

class ProgressBars extends StatelessWidget {
  const ProgressBars({Key? key, required this.barData}) : super(key: key);

  final DownloaderProgress barData;

  @override
  Widget build(BuildContext context) {
    developer.log('current',
        name: 'downloader_modal.dart',
        error:
            '${barData.current.roundToDouble()}/${barData.max.roundToDouble()} ${barData.dcurrent.roundToDouble()}/${barData.dmax.roundToDouble()}');
    return Column(children: [
      const Text('Location Data'),
      LinearProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.primary.withAlpha(100),
        minHeight: 20,
        semanticsValue: barData.current.round().toString(),
        semanticsLabel: ' Downloading',
        value: barData.current / barData.max,
      ),
      Text('${barData.current}/${barData.max}'),
      const Divider(),
      const Text('Location Open Data'),
      LinearProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        minHeight: 20,
        semanticsValue: barData.dcurrent.round().toString(),
        semanticsLabel: ' Downloading',
        value: barData.dcurrent / barData.dmax,
      ),
      Text('${barData.dcurrent}/${barData.dmax}'),
      const Divider(),
      Row(children: [
        const Text('Region...'),
        barData.region ? const Text('OK') : const Center()
      ]),
      const Divider(),
      Row(children: [
        const Text('Province...'),
        barData.province ? const Text('OK') : const Center()
      ]),
      const Divider(),
      Row(children: [
        const Text('Category...'),
        barData.category ? const Text('OK') : const Center()
      ]),
    ]);
  }
}


// navToAttachList(context) async {
//   await Navigator.of(context, rootNavigator: true).pop();
//   await Navigator.pop(context);
// }
// class Test extends StatelessWidget {
//   var value = 0;
//   Test(int i) {
//     value = i;
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.all(50),
//       child: Column(
//         children: [
//           Container(
//             margin: const EdgeInsets.all(4),
//             child: Image.asset('assets/images/finderlein_logo_bunt.png'),
//           ),
//           FAProgressBar(
//             currentValue: value,
//             displayText: '',
//           ),
//           FAProgressBar(
//             currentValue: value,
//             displayText: '',
//           ),
//         ],
//       ),
//     );
//   }
// }
