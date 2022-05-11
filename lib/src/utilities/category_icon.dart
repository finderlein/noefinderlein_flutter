import 'package:flutter/material.dart';

class CategoryIcon extends StatelessWidget {
  const CategoryIcon(
      {Key? key, required this.category, this.size = 24, this.bw = false})
      : super(key: key);

  final int category;
  final int size;
  final bool bw;
  @override
  Widget build(BuildContext context) {
    // BoxDecoration bd = const BoxDecoration(
    //     color: Colors.grey,
    //     backgroundBlendMode: BlendMode.saturation,
    //     border: null);
    ColorFilter cf = const ColorFilter.matrix(<double>[
      0.2126, 0.7152, 0.0722, 0, 0, //
      0.2126, 0.7152, 0.0722, 0, 0,
      0.2126, 0.7152, 0.0722, 0, 0,
      0, 0, 0, 1, 0,
    ]);
    double sized = size.toDouble();
    Widget img =
        Image.asset('assets/images/stifte.png', height: sized, width: sized);
    switch (category) {
      case 1:
        {
          img = Image.asset('assets/images/stifte.png',
              height: sized, width: sized);
          break;
        }
      case 2:
        {
          img = Image.asset('assets/images/burgen_schloesser.png',
              height: sized, width: sized);
          break;
        }
      case 3:
        {
          img = Image.asset('assets/images/museen_ausstellungen.png',
              height: sized, width: sized);
          break;
        }
      case 4:
        {
          img = Image.asset('assets/images/erlebnis_natur.png',
              height: sized, width: sized);
          break;
        }
      case 5:
        {
          img = Image.asset('assets/images/sport_und_freizeit.png',
              height: sized, width: sized);
          break;
        }
      case 6:
        {
          img = Image.asset('assets/images/bergbahnen.png',
              height: sized, width: sized);
          break;
        }
      case 7:
        {
          img = Image.asset('assets/images/schifffahrt.png',
              height: sized, width: sized);
          break;
        }
      case 8:
        {
          img = Image.asset('assets/images/lokalbahn.png',
              height: sized, width: sized);
          break;
        }
    }
    if (bw) {
      return ColorFiltered(
        colorFilter: cf,
        child: img,
      );
    } else {
      return img;
    }
    // return const Center();
  }
}
