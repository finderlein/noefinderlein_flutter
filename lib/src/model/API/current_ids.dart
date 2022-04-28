class CurrentIds {
  int changeid;
  int daysChngId;
  int daysChangeCount;

  CurrentIds(
      {required this.changeid,
      required this.daysChngId,
      required this.daysChangeCount});

  factory CurrentIds.fromJson(Map<String, dynamic> json) {
    return CurrentIds(
      changeid: json['changeid'],
      daysChngId: json['daysChngId'],
      daysChangeCount: json['daysChangeCount'],
    );
  }
}
