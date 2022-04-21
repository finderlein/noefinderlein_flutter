// import 'package:flutter/material.dart';
// import 'package:noefinderlein_flutter/model/Region.dart';
// import 'package:noefinderlein_flutter/pages/locationsListPage.dart';
// import 'package:noefinderlein_flutter/widgets/drawerMain.dart';

// class RegionsListMain extends StatefulWidget {
//   final int year;
//   RegionsListMain({@required this.year});
//   @override
//   RegionsState createState() => RegionsState();
// }

// class RegionsState extends State<RegionsListMain> {
//   final _regions = <Region>[
//     Region(name: 'Donau Niederösterreich', regionNum: 28),
//     Region(name: 'Wienerwald', regionNum: 32),
//     Region(name: 'Weinviertel', regionNum: 38),
//     Region(name: 'Waldviertel', regionNum: 41),
//     Region(name: 'Mostviertel', regionNum: 43),
//     Region(name: 'Wiener Alpen', regionNum: 46),
//     Region(name: 'Burgenland', regionNum: 84),
//     Region(name: 'Wien', regionNum: 85),
//     Region(name: 'Steiermark', regionNum: 86),
//     Region(name: 'Oberösterreich', regionNum: 87),
//     Region(name: 'Salzburg', regionNum: 90),
//   ];
//   final _biggerFont = const TextStyle(fontSize: 18.0);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text('Regionen'),
//         ),
//         body: _buildSuggestions(),
//         drawer: DrawerMain(year: widget.year));
//   }

//   Widget _buildSuggestions() {
//     return ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: _regions.length,
//         physics: BouncingScrollPhysics(),
//         itemBuilder: /*1*/ (context, i) {
//           return _buildRow(_regions[i]);
//         });
//   }

//   Widget _buildRow(Region pair) {
//     return ListTile(
//       title: Text(
//         pair.name,
//         style: _biggerFont,
//       ),
//       onTap: () {
//         Navigator.push(
//           context,
//           MaterialPageRoute(
//               builder: (context) => LocationsListMain(
//                   year: widget.year, regionId: pair.regionNum)),
//         );
//       },
//     );
//   }
// }
