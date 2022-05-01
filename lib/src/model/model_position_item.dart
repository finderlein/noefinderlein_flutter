import 'package:geolocator/geolocator.dart';

class PositionItem {
  PositionItem({required this.type, this.displayValue, this.position});

  final PositionItemType type;
  final String? displayValue;
  final Position? position;
}

enum PositionItemType {
  log,
  position,
}
