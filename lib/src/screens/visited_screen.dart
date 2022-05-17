import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:noefinderlein_flutter/src/database/tables/visited_location.dart';

import '../database/database_helper.dart';
import '../model/model_visited_with_location.dart';
import '../widgets/drawer_main.dart';
import 'dart:developer' as developer;

import 'location_detail_screen.dart';
import '../localization/app_localizations_context.dart';

class VisitedScreen extends StatefulWidget {
  const VisitedScreen({
    Key? key,
    required this.year,
  }) : super(key: key);
  final int year;
  static const routeName = '/visited';

  @override
  State<VisitedScreen> createState() => VisitedScreenState();
}

/// Displays a list of SampleItems.
class VisitedScreenState extends State<VisitedScreen> {
  late Future<List<VisitedWithLocation>> _allVisitedLocations;

  @override
  void initState() {
    super.initState();
    _allVisitedLocations = DatabaseHelper.getVisited(year: widget.year);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMain(year: widget.year),
        appBar: AppBar(
          title: Text(context.loc.visitedScreenTitle),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
        ),
        bottomSheet: FutureBuilder(
          future: _allVisitedLocations,
          builder: (BuildContext context,
              AsyncSnapshot<List<VisitedWithLocation>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:

              // return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.waiting:
              // developer.log('waiting', name: 'visited_screen.dart');
              // return const Center(child: CircularProgressIndicator());

              case ConnectionState.done:
                developer.log('done', name: 'visited_screen.dart');
                List<VisitedWithLocation>? locations = snapshot.data;
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                if (locations != null && locations.isNotEmpty) {
                  return _sumAmountRow(context: context, locations: locations);
                }
                // return visitedList(locations: locations);
                return page(context: context, locations: locations);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ),
        body: FutureBuilder(
          future: _allVisitedLocations,
          builder: (BuildContext context,
              AsyncSnapshot<List<VisitedWithLocation>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return page(context: context);
              // return const Center(child: CircularProgressIndicator());
              case ConnectionState.active:
              case ConnectionState.waiting:
                developer.log('waiting', name: 'visited_screen.dart');
                // return const Center(child: CircularProgressIndicator());
                return page(context: context);
              case ConnectionState.done:
                developer.log('done', name: 'visited_screen.dart');
                List<VisitedWithLocation>? locations = snapshot.data;
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                // return visitedList(locations: locations);
                return page(context: context, locations: locations);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }

  Widget page(
      {required BuildContext context, List<VisitedWithLocation>? locations}) {
    return locations != null
        ? Container(
            decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant,
                image: const DecorationImage(
                    image: AssetImage('assets/images/finderlein_logo_bw.png'))),
            child: locations.isEmpty
                ? Center(
                    child: Text(
                    context.loc.noVisited,
                    style: const TextStyle(fontSize: 20),
                  ))
                : visitedList(locations: locations))
        : Container(
            // color: Theme.of(context).colorScheme.onBackground,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/finderlein_logo_bw.png'))),
            child: const Center(child: CircularProgressIndicator()));
  }

  Widget visitedList({required List<VisitedWithLocation> locations}) {
    return ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: locations.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, i) {
          return _buildRow(locations[i]);
        });
  }

  Widget _buildRow(VisitedWithLocation loc) {
    TextStyle ts = const TextStyle(fontSize: 16);
    return Card(
        child: Column(children: [
      ListTile(
        onLongPress: () async {
          String result = await showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(context.loc.visitedRemoveTitle),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Cancel'),
                      child: Text(context.loc.cancel),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'OK'),
                      child: Text(context.loc.ok),
                    ),
                  ],
                );
              });
          if (result == 'OK') {
            await DatabaseHelper.removeVisited(
                visitedId: loc.visited.visitedId);
            setState(() {
              _allVisitedLocations =
                  DatabaseHelper.getVisited(year: widget.year);
            });
          }
        },
        onTap: () {
          var id = loc.location.id;
          Navigator.restorablePushNamed(
              context, LocationDetailsScreen.routeName,
              arguments: {'locationId': id});
        },
        title: Text(
          loc.location.name.toString(),
          style: ts,
        ),
        subtitle: Text(loc.location.addressCity),
        trailing: Padding(
            padding: const EdgeInsets.only(top: 5),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              Text(
                loc.visited.visitedLoggedDay,
                style: ts,
              ),
              Text(
                '€ ${loc.visited.visitedSaved.toString()}',
                style: ts,
              )
            ])),
      ),
    ]));
  }
}

Widget _sumAmountRow(
    {required BuildContext context,
    required List<VisitedWithLocation> locations}) {
  TextStyle ts =
      TextStyle(fontSize: 20, color: Theme.of(context).colorScheme.onSecondary);
  double savings = 0;
  for (VisitedWithLocation l in locations) {
    savings += l.visited.visitedSaved;
  }
  return Container(
      height: 50,
      padding: const EdgeInsets.only(left: 10, right: 10),
      color: Theme.of(context).colorScheme.secondary,
      child: Row(children: [
        Text(
          'Ges. Ersparnis:',
          style: ts,
        ),
        const Spacer(),
        Text(
          '€ $savings',
          style: ts,
        )
      ]));
}
