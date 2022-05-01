// import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../database/tables/location.dart';
import 'categoryIcon.dart';

class LocationsListItem extends StatelessWidget {
  const LocationsListItem({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: location.bookletNumber != 0,
              child: Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.primary),
                    child: Center(
                      child: Text(
                        location.bookletNumber.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(0.0, 0.0, 2.0, 0.0),
                child: _NameBlock(location: location),
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class _NameBlock extends StatelessWidget {
  const _NameBlock({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                location.name,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Padding(padding: EdgeInsets.only(bottom: 2.0)),
              Row(
                children: <Widget>[
                  Text(
                    location.addressCity,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.onSurface,
                      fontSize: 12.0,
                    ),
                  ),
                  const Spacer(),
                  _MiniItems(location: location)
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MiniItems extends StatelessWidget {
  const _MiniItems({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        location.groupsAccepted
            ? Icon(MdiIcons.accountGroup,
                color: Theme.of(context).colorScheme.onSurface)
            : const Center(),
        location.dogAllowed
            ? Icon(MdiIcons.dogSide,
                color: Theme.of(context).colorScheme.onSurface)
            : const Center(),
        location.strollerFriendly
            ? Icon(MdiIcons.babyCarriage,
                color: Theme.of(context).colorScheme.onSurface)
            : const Center(),
        location.wheelchairFriendly
            ? Icon(MdiIcons.wheelchairAccessibility,
                color: Theme.of(context).colorScheme.onSurface)
            : const Center(),
        location.topLocation
            ? Image.asset('assets/images/top_ausflugsziel.png',
                height: 24, width: 24)
            : const Center(),
        CategoryIcon(category: location.category)
      ],
    );
  }
}
