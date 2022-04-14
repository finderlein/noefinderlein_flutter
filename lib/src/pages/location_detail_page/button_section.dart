import 'package:flutter/material.dart';

import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key, required this.location}) : super(key: key);

  final Location location;
  @override
  Widget build(BuildContext context) {
    Color color = Theme.of(context).colorScheme.secondary;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, MdiIcons.phone, 'CALL'),
        _buildButtonColumn(color, MdiIcons.email, 'MAIL'),
        _buildButtonColumn(color, MdiIcons.earth, 'WEBPAGE'),
        _buildButtonColumn(color, MdiIcons.navigation, 'NAVI'),
        _buildButtonColumn(color, MdiIcons.starOutline, 'FAV'),
      ],
    );
  }
}

TextButton _buildButtonColumn(Color color, IconData icon, String label) {
  return TextButton(
      onPressed: () {},
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: color),
          Container(
            margin: const EdgeInsets.only(top: 8),
            child: Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: color,
              ),
            ),
          ),
        ],
      ));
}
