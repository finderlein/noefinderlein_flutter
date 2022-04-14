import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../database/tables/location.dart';

class LocationsListItem extends StatelessWidget {
  const LocationsListItem({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
    );
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
                style: const TextStyle(
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
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: Colors.black54,
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
        location.groupsAllowed
            ? const Icon(MdiIcons.accountGroup)
            : const Center(),
        location.dogAllowed ? const Icon(MdiIcons.dogSide) : const Center(),
        location.stollerAllowed
            ? const Icon(MdiIcons.babyCarriage)
            : const Center(),
        location.wheelchairAllowed
            ? const Icon(MdiIcons.wheelchairAccessibility)
            : const Center(),
        location.topLocation ? const Icon(MdiIcons.tooltip) : const Center(),
        _CategoryIcon(category: location.category)
      ],
    );
  }
}

class _CategoryIcon extends StatelessWidget {
  const _CategoryIcon({Key? key, required this.category}) : super(key: key);

  final int category;
  @override
  Widget build(BuildContext context) {
    switch (category) {
      case 1:
        {
          return const Icon(MdiIcons.accountGroup);
          // holder.burgstiftusw.setImageResource(R.mipmap.ic_stifte);
        }
      case 2:
        {
          return const Icon(MdiIcons.accountGroup);
          // holder.burgstiftusw.setImageResource(R.mipmap.ic_burgen_schloesser);

        }
      case 3:
        {
          return Icon(MdiIcons.bank,
              color: Theme.of(context).colorScheme.secondary);
          // holder.burgstiftusw
          // .setImageResource(R.mipmap.ic_museen_ausstellungen);

        }
      case 4:
        {
          return const Icon(MdiIcons.accountGroup);
          // holder.burgstiftusw.setImageResource(R.mipmap.ic_erlebnis_natur);

        }
      case 5:
        {
          return const Icon(MdiIcons.accountGroup);
          // holder.burgstiftusw.setImageResource(R.mipmap.ic_sport_und_freizeit);

        }
      case 6:
        {
          return const Icon(MdiIcons.accountGroup);
          // holder.burgstiftusw.setImageResource(R.mipmap.ic_bergbahnen);

        }
      case 7:
        {
          return const Icon(MdiIcons.accountGroup);
          // holder.burgstiftusw.setImageResource(R.mipmap.ic_schifffahrt);

        }
      case 8:
        {
          return const Icon(MdiIcons.accountGroup);
          // holder.burgstiftusw.setImageResource(R.mipmap.ic_lokalbahn);

        }
    }
    return Row(
      children: [
        category == 0 ? const Icon(MdiIcons.accountGroup) : const Center(),
      ],
    );
  }
}
