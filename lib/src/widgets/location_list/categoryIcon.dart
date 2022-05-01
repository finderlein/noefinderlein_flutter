import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon({Key? key, required this.category}) : super(key: key);

  final int category;
  @override
  Widget build(BuildContext context) {
    switch (category) {
      case 1:
        {
          return Image.asset('assets/images/stifte.png', height: 24, width: 24);
        }
      case 2:
        {
          return Image.asset('assets/images/burgen_schloesser.png',
              height: 24, width: 24);
        }
      case 3:
        {
          return Image.asset('assets/images/museen_ausstellungen.png',
              height: 24, width: 24);
        }
      case 4:
        {
          return Image.asset('assets/images/erlebnis_natur.png',
              height: 24, width: 24);
        }
      case 5:
        {
          return Image.asset('assets/images/sport_und_freizeit.png',
              height: 24, width: 24);
        }
      case 6:
        {
          return Image.asset('assets/images/bergbahnen.png',
              height: 24, width: 24);
        }
      case 7:
        {
          return Image.asset('assets/images/schifffahrt.png',
              height: 24, width: 24);
        }
      case 8:
        {
          return Image.asset('assets/images/lokalbahn.png',
              height: 24, width: 24);
        }
    }
    return const Center();
  }
}
