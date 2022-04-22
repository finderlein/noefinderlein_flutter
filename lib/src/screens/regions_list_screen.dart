import 'package:flutter/material.dart';
import '../database/tables/region.dart';
import '../database/database_helper.dart';
import '../widgets/drawer_main.dart';
import '../screens/locations_list_screen.dart';

class RegionsListScreen extends StatefulWidget {
  const RegionsListScreen({Key? key, required this.year}) : super(key: key);

  final int year;
  static const routeName = '/regions';

  @override
  RegionsListScreenState createState() => RegionsListScreenState();
}

class RegionsListScreenState extends State<RegionsListScreen> {
  late Future<List<Region>> allRegions;
  @override
  void initState() {
    super.initState();

    allRegions = DatabaseHelper.getAllRegions();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Regionen'),
        ),
        drawer: DrawerMain(year: widget.year),
        body: FutureBuilder(
          future: allRegions,
          builder:
              (BuildContext context, AsyncSnapshot<List<Region>> snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return regionList(regions: snapshot.data);
              // return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }

  Widget regionList({regions}) {
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: regions.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: /*1*/ (context, i) {
          return _buildRow(regions[i]);
        });
  }

  Widget _buildRow(Region pair) {
    return ListTile(
      leading: Image.asset('assets/images/liste_region_${pair.id}.png'),
      title: Text(
        pair.name,
        style: const TextStyle(fontSize: 18.0),
      ),
      onTap: () {
        Navigator.restorablePushNamed(context, LocationListScreen.routeName);
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //       builder: (context) => LocationsListMain(
        //           year: widget.year, regionId: pair.id)),
        // );
      },
    );
  }
}
