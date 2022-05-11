import 'package:flutter/material.dart';

// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../database/tables/location.dart';

class ButtonCol {
  Color color;
  IconData icon;
  String label;
  VoidCallback onPressed;

  ButtonCol(
      {required this.color,
      required this.icon,
      required this.label,
      required this.onPressed});
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({Key? key, required this.location, required this.bcol})
      : super(key: key);

  final Location location;
  final List<ButtonCol> bcol;
  @override
  Widget build(BuildContext context) {
    // Color color = Theme.of(context).colorScheme.secondary;
    List<Widget> wcol = <Widget>[];
    for (var i = 0; i < bcol.length; i++) {
      wcol.add(_buildButtonColumn(
          bcol[i].color, bcol[i].icon, bcol[i].label, bcol[i].onPressed));
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: wcol);
  }
}

TextButton _buildButtonColumn(
    Color color, IconData icon, String label, VoidCallback onPressed) {
  return TextButton(
      onPressed: onPressed,
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
