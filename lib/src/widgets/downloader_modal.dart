import 'package:flutter/material.dart';
import '../utilities/data_downloader.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
// import '../pages/locations_list_page.dart';
import '../model/model_downloader_progress.dart';

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

  @override
  Widget build(BuildContext context) {
    final d = DownloaderProgress();
    // dd.
    final sb = StreamBuilder(
      stream: dd.refresh(widget.year),
      initialData: d,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            DownloaderProgress d = snapshot.data as DownloaderProgress;
            return FAProgressBar(
              currentValue: d.current,
              displayText: ' Downloading',
              maxValue: d.max,
              border: Border.all(
                width: 1,
              ),
            );
          case ConnectionState.waiting:
            DownloaderProgress d = snapshot.data as DownloaderProgress;
            return FAProgressBar(
              currentValue: d.current,
              displayText: ' Downloading',
              maxValue: d.max,
              border: Border.all(
                width: 1,
              ),
            );
          case ConnectionState.active:
            DownloaderProgress d = snapshot.data as DownloaderProgress;
            return FAProgressBar(
              currentValue: d.current,
              displayText: ' Downloading',
              maxValue: d.max,
              border: Border.all(
                width: 1,
              ),
            );
          case ConnectionState.done:
            print(snapshot.data);
            WidgetsBinding.instance.addPostFrameCallback((_) {
              Navigator.pop(context);
              widget.callback();
            });
            return const Text('done');
        }
        return Container(); // unreachable
      },
    );

    return sb;
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
