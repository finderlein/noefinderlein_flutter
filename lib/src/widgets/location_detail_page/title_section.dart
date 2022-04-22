import 'package:flutter/material.dart';

import '../../database/tables/location.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
          /*1*/
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            Text(location.name, style: const TextStyle(fontSize: 25))
          ]))
    ]);
  }
}
