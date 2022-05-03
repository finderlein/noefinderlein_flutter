import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/model_filter.dart';
import '../utilities/categoryIcon.dart';
import 'package:intl/intl.dart';
import '../localization/app_localizations_context.dart';

class Filter extends StatefulWidget {
  const Filter({Key? key, required this.callback}) : super(key: key);

  final Function callback;
  static const routeName = '/filter';

  @override
  State<Filter> createState() => FilterState();
}

class FilterState extends State<Filter> {
  late DateTime now;
  late DateTime lastDate;
  late FilterElements filterE = FilterElements();

  @override
  void initState() {
    super.initState();

    now = DateTime.now();
    lastDate = now.add(const Duration(days: 365));
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        scrollable: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        title: Row(children: [
          const Icon(MdiIcons.filter),
          Text(context.loc.title_filter)
        ]),
        actions: [
          TextButton(onPressed: () {}, child: Text(context.loc.cancel)),
          TextButton(
              onPressed: () {
                widget.callback();
              },
              child: Text(context.loc.setFilter))
        ],
        content: Builder(builder: (context) {
          return Column(
            children: [
              CheckboxListTile(
                title: Text(context.loc.filter_day_active_text),
                value: filterE.onlyShowOnDate,
                controlAffinity: ListTileControlAffinity.leading,
                onChanged: (bool? value) {
                  if (value != null) {
                    setState(() {
                      filterE.onlyShowOnDate = value;
                    });
                  }
                },
              ),
              ListTile(
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

              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     Expanded(
              //         child: Center(
              //             child:
              //                 TextButton(onPressed: () {}, child: Text('2.5.2022')))),
              //     VerticalDivider(width: 1.0),
              //     Expanded(
              //         child: Center(
              //             child: CheckboxListTile(
              //       title: const Text(
              //           'Nur die Ziele anzeigen die am gewählten Tag offen haben'),
              //       value: false,
              //       onChanged: (bool? value) {},
              //     ))),
              //   ],
              // ),
              const Divider(),
              listTileCategory(context, 0, context.loc.stifte),
              listTileCategory(context, 1, context.loc.burgen_schloesser),
              listTileCategory(context, 2, context.loc.museen_ausstellungen),
              listTileCategory(context, 3, context.loc.erlebnis_natur),
              listTileCategory(context, 4, context.loc.sport_und_freizeit),
              listTileCategory(context, 5, context.loc.bergbahnen),
              listTileCategory(context, 6, context.loc.schifffahrt),
              listTileCategory(context, 7, context.loc.lokalbahn),

              // for (int i = 0; i < categroriesCount; i++) ...[
              //   ListTile(
              //       onTap: () {
              //         setState(() {
              //           filterE.categories[i + 1] = !filterE.categories[i + 1];
              //         });
              //       },
              //       title: Text(categoriesNames[i]),
              //       leading: CategoryIcon(category: i + 1, size: 40))
              // ],
              const Divider(),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.badWeather = !filterE.badWeather;
                    });
                  },
                  title: Text(context.loc.badWeather),
                  leading: const Icon(MdiIcons.weatherRainy)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.childFriendly = !filterE.childFriendly;
                    });
                  },
                  title: Text(context.loc.childFriendly),
                  leading: const Icon(MdiIcons.humanMaleChild)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.strollerFriendly = !filterE.strollerFriendly;
                    });
                  },
                  title: Text(context.loc.strollerFriendly),
                  leading: const Icon(MdiIcons.babyCarriage)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.dogAllowed = !filterE.dogAllowed;
                    });
                  },
                  title: Text(context.loc.dogAllowed),
                  leading: const Icon(MdiIcons.dogSide)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.wheelchairFriendly = !filterE.wheelchairFriendly;
                    });
                  },
                  title: Text(context.loc.wheelchairFriendly),
                  leading: const Icon(MdiIcons.wheelchairAccessibility)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.tavernNear = !filterE.tavernNear;
                    });
                  },
                  title: Text(context.loc.tavernNear),
                  leading: const Icon(MdiIcons.food)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.groupsAccepted = !filterE.groupsAccepted;
                    });
                  },
                  title: Text(context.loc.groupsAccepted),
                  leading: const Icon(MdiIcons.accountGroup)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.openInWinter = !filterE.openInWinter;
                    });
                  },
                  title: Text(context.loc.openInWinter),
                  leading: const Icon(MdiIcons.weatherSnowyHeavy)),
              ListTile(
                  onTap: () {
                    setState(() {
                      filterE.topLocation = !filterE.topLocation;
                    });
                  },
                  title: Text(context.loc.topLocation),
                  leading: Image.asset('assets/images/top_ausflugsziel.png',
                      height: 24, width: 24)),
            ],
          );
        }));
  }

  Widget listTileCategory(BuildContext context, int category, String text) {
    return ListTile(
        onTap: () {
          setState(() {
            filterE.categories[category] = !filterE.categories[category];
          });
        },
        title: Text(text),
        leading: CategoryIcon(category: (category + 1), size: 40));
  }
}
