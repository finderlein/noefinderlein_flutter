import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/model_filter.dart';
import '../utilities/categoryIcon.dart';
import 'package:intl/intl.dart';
import '../localization/app_localizations_context.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key, required this.callback, required this.filterE})
      : super(key: key);

  final Function callback;
  final FilterElements filterE;
  static const routeName = '/filter';

  @override
  State<Filter> createState() => FilterState();
}

class FilterState extends State<Filter> {
  late DateTime now;
  late DateTime lastDate;
  late FilterElements filterE = widget.filterE;

  final bool fullpage = false;
  @override
  void initState() {
    super.initState();

    now = DateTime.now();
    lastDate = now.add(const Duration(days: 365));
  }

  @override
  Widget build(BuildContext context) {
    TextStyle ts = TextStyle(color: Theme.of(context).colorScheme.onSurface);
    if (fullpage) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Row(children: [
                const Icon(MdiIcons.filter),
                Text(context.loc.title_filter)
              ]),
              bottom: const TabBar(
                tabs: [
                  Tab(icon: Icon(MdiIcons.calendar)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ],
              ),
            ),
            body: TabBarView(
              children: [
                ListView(children: dayactive()),
                ListView(children: propertiesFilter()),
                ListView(children: categoryFilter()),
              ],
            ),
          ));
    } else {
      return AlertDialog(
          insetPadding: const EdgeInsets.all(20),
          scrollable: true,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          title: Row(children: [
            const Icon(MdiIcons.filter),
            Text(context.loc.title_filter),
            const Spacer(),
            IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(MdiIcons.close))
          ]),
          content: Builder(builder: (context) {
            return Column(
                children: dayactive() +
                    [const Divider()] +
                    propertiesFilter() +
                    [const Divider()] +
                    categoryFilter() +
                    [
                      SizedBox(
                          width: double.infinity,
                          child: Wrap(
                            alignment: WrapAlignment.spaceEvenly,
                            children: [
                              Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        filterE = FilterElements();
                                        widget.callback(filterE);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(context.loc.resetFilter,
                                          style: ts))),
                              Padding(
                                  padding: const EdgeInsets.only(top: 30),
                                  child: ElevatedButton(
                                      onPressed: () {
                                        widget.callback(filterE);
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(context.loc.setFilter,
                                          style: ts)))
                            ],
                          ))
                    ]);
          }));
    }
  }

  List<Widget> dayactive() {
    return [
      CheckboxListTile(
        contentPadding: EdgeInsets.zero,
        title: Text(context.loc.filter_day_active_text),
        value: filterE.onlyShowOnDate,
        // controlAffinity: ListTileControlAffinity.leading,
        onChanged: (bool? value) {
          if (value != null) {
            setState(() {
              filterE.onlyShowOnDate = value;
            });
          }
        },
      ),
      ListTile(
        contentPadding: EdgeInsets.zero,
        enabled: filterE.onlyShowOnDate,
        title: Text(DateFormat('yyyy-MM-dd').format(filterE.date)),
        leading: const Icon(MdiIcons.calendar),
        onTap: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            firstDate: now,
            initialDate: now,
            lastDate: lastDate,
          );
          if (pickedDate != null) {
            setState(() {
              filterE.date = pickedDate;
            });
          }
        },
      ),
    ];
  }

  List<Widget> categoryFilter() {
    return [
      // const Divider(),
      listTileCategory(context, 0, context.loc.stifte),
      listTileCategory(context, 1, context.loc.burgen_schloesser),
      listTileCategory(context, 2, context.loc.museen_ausstellungen),
      listTileCategory(context, 3, context.loc.erlebnis_natur),
      listTileCategory(context, 4, context.loc.sport_und_freizeit),
      listTileCategory(context, 5, context.loc.bergbahnen),
      listTileCategory(context, 6, context.loc.schifffahrt),
      listTileCategory(context, 7, context.loc.lokalbahn),
    ];
  }

  List<Widget> propertiesFilter() {
    return [
      // const Divider(),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.badWeather = !filterE.badWeather;
            });
          },
          title: Text(context.loc.badWeather),
          leading: const Icon(MdiIcons.weatherRainy),
          trailing: Text(
              filterE.badWeather ? context.loc.must : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.childFriendly = !filterE.childFriendly;
            });
          },
          title: Text(context.loc.childFriendly),
          leading: const Icon(MdiIcons.humanMaleChild),
          trailing: Text(
              filterE.childFriendly ? context.loc.must : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.strollerFriendly = !filterE.strollerFriendly;
            });
          },
          title: Text(context.loc.strollerFriendly),
          leading: const Icon(MdiIcons.babyCarriage),
          trailing: Text(filterE.strollerFriendly
              ? context.loc.must
              : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.dogAllowed = !filterE.dogAllowed;
            });
          },
          title: Text(context.loc.dogAllowed),
          leading: const Icon(MdiIcons.dogSide),
          trailing: Text(
              filterE.dogAllowed ? context.loc.must : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.wheelchairFriendly = !filterE.wheelchairFriendly;
            });
          },
          title: Text(context.loc.wheelchairFriendly),
          leading: const Icon(MdiIcons.wheelchairAccessibility),
          trailing: Text(filterE.wheelchairFriendly
              ? context.loc.must
              : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.tavernNear = !filterE.tavernNear;
            });
          },
          title: Text(context.loc.tavernNear),
          leading: const Icon(MdiIcons.food),
          trailing: Text(
              filterE.tavernNear ? context.loc.must : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.groupsAccepted = !filterE.groupsAccepted;
            });
          },
          title: Text(context.loc.groupsAccepted),
          leading: const Icon(MdiIcons.accountGroup),
          trailing: Text(filterE.groupsAccepted
              ? context.loc.must
              : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.openInWinter = !filterE.openInWinter;
            });
          },
          title: Text(context.loc.openInWinter),
          leading: const Icon(MdiIcons.weatherSnowyHeavy),
          trailing: Text(
              filterE.openInWinter ? context.loc.must : context.loc.dontcare)),
      ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: () {
            setState(() {
              filterE.topLocation = !filterE.topLocation;
            });
          },
          title: Text(context.loc.topLocation),
          leading: Image.asset('assets/images/top_ausflugsziel.png',
              height: 24, width: 24),
          trailing: Text(
              filterE.topLocation ? context.loc.must : context.loc.dontcare)),
    ];
  }

  Widget listTileCategory(BuildContext context, int category, String text) {
    return ListTile(
        contentPadding: EdgeInsets.zero,
        onTap: () {
          setState(() {
            filterE.categories[category] = !filterE.categories[category];
          });
        },
        tileColor: !filterE.categories[category] ? Colors.black12 : null,
        title: Text(text),
        leading: CategoryIcon(
            category: (category + 1),
            size: 40,
            bw: !filterE.categories[category]));
  }
}
