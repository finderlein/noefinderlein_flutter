import 'package:flutter/material.dart';

class ActionItem {
  late Icon icon;
  late String tooltip;
  late Function()? onPressed;
  ActionItem(
      {required this.icon, required this.tooltip, required this.onPressed});
}
