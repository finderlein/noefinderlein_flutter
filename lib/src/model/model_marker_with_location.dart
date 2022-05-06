import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

import '../database/tables/location.dart';

class MarkerLocation extends Marker {
  MarkerLocation(
      {required LatLng point,
      required WidgetBuilder builder,
      required double width,
      required double height,
      required this.location})
      : super(point: point, builder: builder, width: width, height: height);
  final Location location;
}
