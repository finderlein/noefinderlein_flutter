import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noefinderlein_flutter/src/screens/map_screen.dart';
import 'dart:developer' as developer;
import '../database/database_helper.dart';
// import '../database/tables/location.dart';
import '../model/model_actionitem.dart';
import '../model/model_filter.dart';
import '../model/model_location_with_open.dart';
import '../widgets/filter_modal.dart';
import '../widgets/location_list/filter_active_item.dart';
import '../widgets/location_list/locations_list.dart';
import '../widgets/drawer_main.dart';
import '../widgets/downloader_modal.dart';
import '../widgets/search_text_field.dart';
import '../utilities/noefinderlein.dart';

import '../localization/app_localizations_context.dart';

class LocationListScreen extends StatefulWidget {
  const LocationListScreen(
      {Key? key,
      required this.regionId,
      required this.year,
      this.drawer = true,
      this.favorites = false})
      : super(key: key);
  final int regionId;
  final int year;
  final bool drawer;
  final bool favorites;
  static const routeName = '/all';

  @override
  State<LocationListScreen> createState() => _LocationListScreenState();
}

/// Displays a list of SampleItems.
class _LocationListScreenState extends State<LocationListScreen> {
  late Future<List<LocationWithOpen>> _allmenuLocations;
  String customTitle = '';
  bool _search = false;
  String searchString = '';
  List<int> currentIds = [];
  Noefinderlein glob = Noefinderlein();
  String sortBy = 'name';
  FilterElements filterE = FilterElements();
  bool filterActive = false;

  @override
  void initState() {
    super.initState();

    developer.log('regionId',
        name: 'locations_list_screen.dart', error: widget.regionId.toString());
    restartDBGet();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.favorites) {
      customTitle = context.loc.favorites;
    } else {
      customTitle = DatabaseHelper.getRegionName(widget.regionId);
    }
    if (!glob.downloaderRan) {
      glob.downloaderRan = true;
      Future.delayed(
          Duration.zero,
          () => showDownloader(context).then((_) {
                developer.log('downloadcallback:',
                    name: 'locations_list_screen.dart', error: 'now');
                if (Navigator.canPop(context)) {
                  Navigator.pop(context);
                }
                Navigator.pushReplacementNamed(
                  context,
                  LocationListScreen.routeName,
                );
              }));
    }
    return Scaffold(
        drawer: widget.drawer ? DrawerMain(year: widget.year) : null,
        appBar: AppBar(
          title: !_search
              ? Text(customTitle)
              : SearchTextField(onChanged: (value) {
                  String low = value.toLowerCase();
                  developer.log('searchbox',
                      name: 'locations_list_screen.dart', error: low);
                  setState(() {
                    searchString = low;
                    restartDBGet();
                  });
                }),
          backgroundColor: Theme.of(context).colorScheme.primary,
          foregroundColor: Theme.of(context).colorScheme.onPrimary,
          actions: [
            !_search
                ? IconButton(
                    icon: const Icon(MdiIcons.magnify),
                    tooltip: context.loc.search,
                    onPressed: () {
                      setState(() {
                        //add
                        _search = true;
                      });
                    },
                  )
                : IconButton(
                    icon: const Icon(Icons.clear),
                    tooltip: context.loc.closeSearch,
                    onPressed: () {
                      setState(() {
                        //add
                        _search = false;
                        searchString = '';
                        restartDBGet();
                      });
                    },
                  ),
            ...getAppbarActions(),
            if (_search) actionsInPopup()
          ],
        ),

        // To work with lists that may contain a large number of items, it’s best
        // to use the ListView.builder constructor.
        //
        // In contrast to the default ListView constructor, which requires
        // building all Widgets up front, the ListView.builder constructor lazily
        // builds Widgets as they’re scrolled into view.
        body: FutureBuilder(
          future: _allmenuLocations,
          builder: (BuildContext context,
              AsyncSnapshot<List<LocationWithOpen>> snapshot) {
            developer.log('connectionState',
                name: 'locations_list_screen.dart',
                error: snapshot.connectionState);
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Text('Press button to start.');
              case ConnectionState.active:
              case ConnectionState.waiting:
                developer.log('waiting', name: 'locations_list_screen.dart');
                return const Center(child: CircularProgressIndicator());
              case ConnectionState.done:
                // developer.log('done',
                //     name: 'locations_list_screen.dart', error: snapshot.data);
                if (snapshot.data != null) {
                  currentIds = genIdList(snapshot.data);
                  return Column(children: [
                    if (filterActive)
                      FilterActiveItem(
                        filterE: filterE,
                      ),
                    Expanded(child: LocationsList(locations: snapshot.data!))
                  ]);
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Text('Result: ${snapshot.data}');
            }
          },
        ));
  }

  List<ActionItem> getActions() {
    return [
      ActionItem(
        icon: const Icon(MdiIcons.download),
        tooltip: context.loc.ttDownloadData,
        onPressed: () {
          Future.delayed(
              Duration.zero,
              () => showDownloader(context).then(
                    (_) {
                      developer.log('downloadcallback:',
                          name: 'locations_list_screen.dart', error: 'now');
                      if (Navigator.canPop(context)) {
                        Navigator.pop(context);
                      }
                      Navigator.pushReplacementNamed(
                        context,
                        LocationListScreen.routeName,
                      );
                    },
                  ));
        },
      ),
      ActionItem(
          icon: const Icon(MdiIcons.sortAlphabeticalVariant),
          tooltip: context.loc.ttChangeSorting,
          onPressed: () => showDialog(
              context: context,
              builder: (BuildContext context) =>
                  AlertDialog(title: Text(context.loc.sortby), actions: [
                    TextButton(
                        onPressed: () => Navigator.pop(context, 'bookletId'),
                        child: Text(
                          context.loc.bookletId,
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.onSurface),
                        )),
                    TextButton(
                        onPressed: () => Navigator.pop(context, 'name'),
                        child: Text(context.loc.name,
                            style: TextStyle(
                                color:
                                    Theme.of(context).colorScheme.onSurface))),
                  ])).then((value) => setState(() {
                //add
                if (value != null) {
                  sortBy = value;
                  restartDBGet();
                }
              }))),
      ActionItem(
        icon: Icon(filterActive ? MdiIcons.filter : MdiIcons.filterOutline),
        tooltip: context.loc.ttFilterList,
        onPressed: () {
          // showDialog(
          //     context: context,
          //     builder: (context) => Filter(callback: () {}));
          showDialog(
              context: context,
              builder: (context) {
                return Filter(
                    filterE: filterE,
                    callback: (FilterElements filterEC) {
                      setState(() {
                        filterE = filterEC;
                        filterActive = filterE.filterActive();
                        restartDBGet();
                      });
                    });
              });
        },
      ),
      ActionItem(
        icon: const Icon(MdiIcons.map),
        tooltip: context.loc.ttShowLocationsOnMap,
        onPressed: () {
          Navigator.restorablePushNamed(context, MapScreen.routeName,
              arguments: {'locations': currentIds});
        },
      )
    ];
  }

  PopupMenuButton actionsInPopup() {
    List<ActionItem> alist = getActions();
    return PopupMenuButton(
      elevation: 40,
      onSelected: (value) async {
        if (alist[value].onPressed != null) {
          alist[value].onPressed!();
        }
      },
      itemBuilder: (BuildContext context) => alist
          .asMap()
          .keys
          .toList()
          .map((index) => PopupMenuItem(
                value: index,
                child: Text(alist[index].tooltip),
              ))
          .toList(),
    );
  }

  List<Widget> getAppbarActions() {
    if (_search) {
      return [];
    }
    List<ActionItem> alist = getActions();
    List<Widget> w = [];
    for (var element in alist) {
      w.add(IconButton(
          icon: element.icon,
          tooltip: element.tooltip,
          onPressed: element.onPressed));
    }
    return w;
  }

  void restartDBGet() {
    setState(() {
      _allmenuLocations = DatabaseHelper.getAllLocations(
          year: widget.year,
          regionId: widget.regionId,
          favorites: widget.favorites,
          searchString: searchString,
          sortBy: sortBy,
          filterE: filterE);
    });
  }

  Future<void> showDownloader(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
            scrollable: true,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            title: Text(context.loc.downloadingTitle(widget.year.toString())),
            content: Builder(builder: (context) {
              return Downloader(year: widget.year);
            })));
  }
}

String genIdString(List<LocationWithOpen>? locations) {
  if (locations != null) {
    return locations.map((e) => e.location.id).join(',');
  } else {
    return '';
  }
}

List<int> genIdList(List<LocationWithOpen>? locations) {
  if (locations != null) {
    return locations.map((e) => e.location.id).toList();
  } else {
    return [];
  }
}
