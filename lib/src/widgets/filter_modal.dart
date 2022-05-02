import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../model/model_filter.dart';
import '../utilities/categoryIcon.dart';
import 'package:intl/intl.dart';

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
        title: Row(children: [Icon(MdiIcons.filter), Text('Filter the list')]),
        actions: [
          TextButton(onPressed: () {}, child: Text('abbrechen')),
          TextButton(
              onPressed: () {
                widget.callback();
              },
              child: Text('Filter anwenden'))
        ],
        content: Builder(builder: (context) {
          return Column(
            children: [
              CheckboxListTile(
                title: const Text(
                    'Nur die Ziele anzeigen die am gewählten Tag offen haben'),
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
                leading: Icon(MdiIcons.calendar),
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
              Divider(),
              ListTile(
                iconColor: ,
                  onTap: () {},
                  title: Text('Stift'),
                  leading: CategoryIcon(category: 1, size: 40)),
              Row(
                children: [
                  Expanded(
                      child: Center(
                          child: ListTile(
                              onTap: () {},
                              title: Text('Stift'),
                              leading: CategoryIcon(category: 1, size: 40)))),
                  VerticalDivider(width: 1.0),
                  Expanded(
                      child: Center(
                          child: ListTile(
                              onTap: () {},
                              title: Text('Sport und Freizeit'),
                              leading: CategoryIcon(category: 1))))
                ],
              ),
              Row(
                children: [
                  Expanded(
                      child: Center(
                          child: ListTile(
                              onTap: () {},
                              title: Text('Stift'),
                              leading: CategoryIcon(category: 1)))),
                  VerticalDivider(width: 1.0),
                  Expanded(
                      child: Center(
                          child: ListTile(
                              onTap: () {},
                              title: Text('Sport und Freizeit'),
                              leading: CategoryIcon(category: 1))))
                ],
              ),
              Divider(),
              Row(children: [])
            ],
          );
        }));
  }
}
