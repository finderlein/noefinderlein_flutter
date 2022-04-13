import 'package:flutter/material.dart';
import '../utils/data_downloader.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import '../pages/locations_list_page.dart';

class Downloader extends StatefulWidget {
  final int year;
  static const routeName = '/downloader';

  Downloader({required this.year});
  @override
  State createState() => DownloaderState();
}

class DownloaderState extends State<Downloader> {
  DataDownloader dd = DataDownloader();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: dd.refresh(widget.year),
      initialData: 0,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        }
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/finderlein_logo_bunt.png'),
                  // ...
                ),
                // ...
              ),
            );
          case ConnectionState.waiting:
            return const Text('Awaiting bids...');
          case ConnectionState.active:
            print(snapshot.data);
            return Test(2);
          case ConnectionState.done:
            print(snapshot.data);
            return const Text('done');

        }
        return Container(); // unreachable
      },
    );
  }
}

class Test extends StatelessWidget {
  var value = 0;
  Test(int i) {
    value = i;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(4),
            child: Image.asset('assets/images/finderlein_logo_bunt.png'),
          ),
          FAProgressBar(
            currentValue: value,
            displayText: '',
          ),
          FAProgressBar(
            currentValue: value,
            displayText: '',
          ),
        ],
      ),
    );
  }
}
