class DownloaderProgress {
  late double current;
  late double max;
  late double dcurrent;
  late double dmax;
  bool region = false;
  bool province = false;
  bool category = false;
}

class DownloaderProgressNull {
  double? current;
  double? max;
  double? dcurrent;
  double? dmax;
  bool? region;
  bool? province;
  bool? category;
  String error = '';
}
