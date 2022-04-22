import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';

class DescriptionSection extends StatelessWidget {
  const DescriptionSection({Key? key, required this.location})
      : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Text(location.description, softWrap: true)],
      )),
      Column(
        children: [
          location.groupsAccepted
              ? Row(children: const [Icon(MdiIcons.accountGroup)])
              : const Center(),
          location.dogAllowed
              ? Row(children: const [Icon(MdiIcons.dogSide)])
              : const Center(),
          location.strollerFriendly
              ? Row(children: const [Icon(MdiIcons.babyCarriage)])
              : const Center(),
          location.wheelchairFriendly
              ? Row(children: const [Icon(MdiIcons.wheelchairAccessibility)])
              : const Center(),
          location.topLocation
              ? Row(children: const [Icon(MdiIcons.tooltip)])
              : const Center()
        ],
      ),
    ]);
  }
}

      // Expanded(
      //     /*1*/
      //     child: Column(
      //         crossAxisAlignment: CrossAxisAlignment.start,
      //         children: [Text(location.description)]))