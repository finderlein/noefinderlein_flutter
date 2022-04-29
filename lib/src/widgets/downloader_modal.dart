import 'package:flutter/material.dart';
import '../utilities/data_downloader.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
// import '../pages/locations_list_page.dart';
import '../model/model_downloader_progress.dart';
import 'dart:developer' as developer;

class Downloader extends StatefulWidget {
  const Downloader({Key? key, required this.year, required this.callback})
      : super(key: key);
  final int year;
  final Function callback;
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
                Navigator.pop(context);
                widget.callback();
              });
            }
            return ProgressBars(barData: dp);
        }
        return Container(); // unreachable
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
      Text('Location Data'),
      LinearProgressIndicator(
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
        // progressColor: Theme.of(context).colorScheme.primary,
        minHeight: 20,
        semanticsValue: barData.current.round().toString(),
        semanticsLabel: ' Downloading',
        value: barData.current / barData.max,
        // border: Border.all(
        //   width: 1,
        // ),
        // displayTextStyle:
        //     TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      Text('${barData.current}/${barData.max}'),
      Divider(),
      Text('Location Open Data'),
      LinearProgressIndicator(
        color: Theme.of(context).colorScheme.secondary,
        backgroundColor:
            Theme.of(context).colorScheme.secondary.withOpacity(0.5),
        // progressColor: Theme.of(context).colorScheme.primary,
        minHeight: 20,
        semanticsValue: barData.dcurrent.round().toString(),
        semanticsLabel: ' Downloading',
        value: barData.dcurrent / barData.dmax,
        // border: Border.all(
        //   width: 1,
        // ),
        // displayTextStyle:
        //     TextStyle(color: Theme.of(context).colorScheme.onPrimary),
      ),
      Text('${barData.dcurrent}/${barData.dmax}'),
      Divider(),
      Row(children: [
        Text('Region...'),
        barData.region ? Text('OK') : Center()
      ]),
      Divider(),
      Row(children: [
        Text('Province...'),
        barData.province ? Text('OK') : Center()
      ]),
      Divider(),
      Row(children: [
        Text('Category...'),
        barData.category ? Text('OK') : Center()
      ]),
      // FAProgressBar(
      //   backgroundColor:
      //       Theme.of(context).colorScheme.secondary.withOpacity(0.5),
      //   progressColor: Theme.of(context).colorScheme.secondary,
      //   currentValue: ((barData.dcurrent / barData.dmax) * 100).roundToDouble(),
      //   displayText: ' %',
      //   // maxValue: barData.max.roundToDouble(),

      //   displayTextStyle: TextStyle(
      //       fontSize: 10, color: Theme.of(context).colorScheme.onSecondary),
      //   // border: Border.all(
      //   //   width: 1,
      //   // ),
      // ),
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
