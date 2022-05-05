import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:noefinderlein_flutter/src/utilities/categoryIcon.dart';
import '../../model/model_filter.dart';
import 'package:intl/intl.dart';
import '../../localization/app_localizations_context.dart';

class FilterActiveItem extends StatelessWidget {
  const FilterActiveItem({Key? key, required this.filterE}) : super(key: key);

  final FilterElements filterE;

  @override
  Widget build(BuildContext context) {
    Color top = Theme.of(context).colorScheme.onSecondary;
    TextStyle ts = TextStyle(color: top);
    List<Widget> cats = getCat(context: context, color: top, ts: ts);
    List<Widget> props = getProp(context: context, color: top, ts: ts);
    return Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 6, bottom: 6),
        color: Theme.of(context).colorScheme.secondary,
        child: Wrap(
          alignment: WrapAlignment.center,
          children: [
                Text(
                  context.loc.filteracive,
                  style: ts,
                ),
                const SizedBox(
                  width: 10,
                ),
                if (filterE.onlyShowOnDate)
                  Text(DateFormat('yyyy-MM-dd').format(filterE.date),
                      style: ts),
              ] +
              [
                if (filterE.onlyShowOnDate &&
                    (props.isNotEmpty || cats.isNotEmpty))
                  Text(' & ', style: ts)
              ] +
              props +
              [
                if (cats.isNotEmpty &&
                    (props.isNotEmpty || filterE.onlyShowOnDate))
                  Text('&', style: ts)
              ] +
              cats,
        ));
  }

  List<Widget> getProp(
      {required BuildContext context,
      required Color color,
      required TextStyle ts}) {
    List<Widget> lw = <Widget>[];
    if (filterE.badWeather) lw.add(Icon(MdiIcons.weatherRainy, color: color));
    if (filterE.childFriendly) {
      lw.add(Icon(MdiIcons.humanMaleChild, color: color));
    }
    if (filterE.strollerFriendly) {
      lw.add(Icon(MdiIcons.babyCarriage, color: color));
    }
    if (filterE.dogAllowed) lw.add(Icon(MdiIcons.dogSide, color: color));
    if (filterE.wheelchairFriendly) {
      lw.add(Icon(MdiIcons.wheelchairAccessibility, color: color));
    }
    if (filterE.tavernNear) lw.add(Icon(MdiIcons.food, color: color));
    if (filterE.groupsAccepted) {
      lw.add(Icon(MdiIcons.accountGroup, color: color));
    }
    if (filterE.openInWinter) {
      lw.add(Icon(MdiIcons.weatherSnowyHeavy, color: color));
    }
    if (filterE.topLocation) {
      lw.add(Image.asset('assets/images/top_ausflugsziel.png'));
    }
    if (lw.length > 1) {
      List<Widget> lw2 = <Widget>[];
      bool first = true;
      for (var element in lw) {
        if (!first) {
          lw2.add(Text('&', style: ts));
        }
        lw2.add(element);
        if (first) {
          first = false;
        }
      }
      return lw2;
    }
    return lw;
  }

  List<Widget> getCat(
      {required BuildContext context,
      required Color color,
      required TextStyle ts}) {
    List<Widget> lw = <Widget>[];
    for (int i = 0; i < filterE.categories.length; i++) {
      if (!filterE.categories[i]) {
        lw.add(CategoryIcon(
          category: i + 1,
        ));
      }
    }
    if (lw.length > 1) {
      List<Widget> lw2 = <Widget>[];
      lw2.add(Text('(', style: ts));
      bool first = true;
      for (var element in lw) {
        if (!first) {
          lw2.add(Text('|', style: ts));
        }
        lw2.add(element);
        if (first) {
          first = false;
        }
      }
      lw2.add(Text(')', style: ts));
      return lw2;
    }
    return lw;
  }
}
