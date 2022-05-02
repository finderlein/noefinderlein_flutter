import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({Key? key, required this.category, this.size = 24})
      : super(key: key);

  final int category;
  final int size;
  @override
  Widget build(BuildContext context) {
    double sized = size.toDouble();
    switch (category) {
      case 1:
        {
          return Image.asset('assets/images/stifte.png',
              height: sized, width: sized);
        }
      case 2:
        {
          return Image.asset('assets/images/burgen_schloesser.png',
              height: sized, width: sized);
        }
      case 3:
        {
          return Image.asset('assets/images/museen_ausstellungen.png',
              height: sized, width: sized);
        }
      case 4:
        {
          return Image.asset('assets/images/erlebnis_natur.png',
              height: sized, width: sized);
        }
      case 5:
        {
          return Image.asset('assets/images/sport_und_freizeit.png',
              height: sized, width: sized);
        }
      case 6:
        {
          return Image.asset('assets/images/bergbahnen.png',
              height: sized, width: sized);
        }
      case 7:
        {
          return Image.asset('assets/images/schifffahrt.png',
              height: sized, width: sized);
        }
      case 8:
        {
          return Image.asset('assets/images/lokalbahn.png',
              height: sized, width: sized);
        }
    }
    return const Center();
  }
}
