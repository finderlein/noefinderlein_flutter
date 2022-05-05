class FilterElements {
  DateTime date = DateTime.now();
  bool onlyShowOnDate = false;
  List<bool> categories = <bool>[
    true,
    true,
    true,
    true,
    true,
    true,
    true,
    true
  ];

  bool badWeather = false;
  bool childFriendly = false;
  bool strollerFriendly = false;
  bool dogAllowed = false;
  bool tavernNear = false;
  bool wheelchairFriendly = false;
  bool groupsAccepted = false;
  bool topLocation = false;
  bool openInWinter = false;

  bool filterActive() {
    bool f = false;
    for (bool c in categories) {
      if (!c) {
        f = true;
        break;
      }
    }
    return f ||
        onlyShowOnDate ||
        badWeather ||
        childFriendly ||
        strollerFriendly ||
        dogAllowed ||
        tavernNear ||
        wheelchairFriendly ||
        groupsAccepted ||
        topLocation ||
        openInWinter;
  }
}
