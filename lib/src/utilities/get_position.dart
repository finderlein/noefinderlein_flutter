import 'package:geolocator/geolocator.dart';

import '../database/database_helper.dart';
import '../model/model_position_item.dart';

class GetPosition {
  static const String _kLocationServicesDisabledMessage =
      'Location services are disabled.';
  static const String _kPermissionDeniedMessage = 'Permission denied.';
  static const String _kPermissionDeniedForeverMessage =
      'Permission denied forever.';
  static const String _kPermissionGrantedMessage = 'Permission granted.';

  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  final List<PositionItem> positionItems = <PositionItem>[];
  final List<Position> positionList = <Position>[];
  final Function callback;

  GetPosition({required this.callback});

  Future<void> getCurrentPosition() async {
    try {
      final hasPermission = await _handlePermission();

      if (!hasPermission) {
        return;
      }

      final position = await _geolocatorPlatform.getCurrentPosition();
      _updatePositionList(
        type: PositionItemType.position,
        position: position,
      );
    } catch (e) {
      _updatePositionList(
        type: PositionItemType.log,
        displayValue: e.toString(),
      );
    }
  }

  Future<bool> _handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      _updatePositionList(
        type: PositionItemType.log,
        displayValue: _kLocationServicesDisabledMessage,
      );

      return false;
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        _updatePositionList(
          type: PositionItemType.log,
          displayValue: _kPermissionDeniedMessage,
        );

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      _updatePositionList(
        type: PositionItemType.log,
        displayValue: _kPermissionDeniedForeverMessage,
      );

      return false;
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    _updatePositionList(
      type: PositionItemType.log,
      displayValue: _kPermissionGrantedMessage,
    );
    return true;
  }

  void _updatePositionList(
      {required PositionItemType type,
      String? displayValue,
      Position? position}) {
    positionItems.add(PositionItem(
        type: type, displayValue: displayValue, position: position));
    if (position != null) {
      positionList.add(position);
    }
    callback();
  }

  // bool _isListening() => !(_positionStreamSubscription == null ||
  //     _positionStreamSubscription!.isPaused);

  // Color _determineButtonColor() {
  //   return _isListening() ? Colors.green : Colors.red;
  // }

  // void _toggleServiceStatusStream() {
  //   if (_serviceStatusStreamSubscription == null) {
  //     final serviceStatusStream = _geolocatorPlatform.getServiceStatusStream();
  //     _serviceStatusStreamSubscription =
  //         serviceStatusStream.handleError((error) {
  //       _serviceStatusStreamSubscription?.cancel();
  //       _serviceStatusStreamSubscription = null;
  //     }).listen((serviceStatus) {
  //       String serviceStatusValue;
  //       if (serviceStatus == ServiceStatus.enabled) {
  //         if (positionStreamStarted) {
  //           _toggleListening();
  //         }
  //         serviceStatusValue = 'enabled';
  //       } else {
  //         if (_positionStreamSubscription != null) {
  //           setState(() {
  //             _positionStreamSubscription?.cancel();
  //             _positionStreamSubscription = null;
  //             _updatePositionList(
  //                 type: PositionItemType.log,
  //                 displayValue: 'Position Stream has been canceled');
  //           });
  //         }
  //         serviceStatusValue = 'disabled';
  //       }
  //       _updatePositionList(
  //         type: PositionItemType.log,
  //         displayValue: 'Location service has been $serviceStatusValue',
  //       );
  //     });
  //   }
  // }

  // void _toggleListening() {
  //   if (_positionStreamSubscription == null) {
  //     final positionStream = _geolocatorPlatform.getPositionStream();
  //     _positionStreamSubscription = positionStream.handleError((error) {
  //       _positionStreamSubscription?.cancel();
  //       _positionStreamSubscription = null;
  //     }).listen((position) => _updatePositionList(
  //           type: PositionItemType.position,
  //           position: position,
  //         ));
  //     _positionStreamSubscription?.pause();
  //   }

  //   setState(() {
  //     if (_positionStreamSubscription == null) {
  //       return;
  //     }

  //     String statusDisplayValue;
  //     if (_positionStreamSubscription!.isPaused) {
  //       _positionStreamSubscription!.resume();
  //       statusDisplayValue = 'resumed';
  //     } else {
  //       _positionStreamSubscription!.pause();
  //       statusDisplayValue = 'paused';
  //     }

  //     _updatePositionList(
  //       type: PositionItemType.log,
  //       displayValue: 'Listening for position updates $statusDisplayValue',
  //     );
  //   });
  // }

  void getLastKnownPosition() async {
    try {
      final position = await _geolocatorPlatform.getLastKnownPosition();
      if (position != null) {
        _updatePositionList(
          type: PositionItemType.position,
          position: position,
        );
      } else {
        _updatePositionList(
          type: PositionItemType.log,
          displayValue: 'No last known position available',
        );
      }
    } catch (exception) {
      _updatePositionList(
        type: PositionItemType.log,
        displayValue: 'location permission denied',
      );
    }
  }

  void getLocationAccuracy() async {
    final status = await _geolocatorPlatform.getLocationAccuracy();
    _handleLocationAccuracyStatus(status);
  }

  void requestTemporaryFullAccuracy() async {
    final status = await _geolocatorPlatform.requestTemporaryFullAccuracy(
      purposeKey: "TemporaryPreciseAccuracy",
    );
    _handleLocationAccuracyStatus(status);
  }

  void _handleLocationAccuracyStatus(LocationAccuracyStatus status) {
    String locationAccuracyStatusValue;
    if (status == LocationAccuracyStatus.precise) {
      locationAccuracyStatusValue = 'Precise';
    } else if (status == LocationAccuracyStatus.reduced) {
      locationAccuracyStatusValue = 'Reduced';
    } else {
      locationAccuracyStatusValue = 'Unknown';
    }
    _updatePositionList(
      type: PositionItemType.log,
      displayValue: '$locationAccuracyStatusValue location accuracy granted.',
    );
  }

  void openAppSettings() async {
    final opened = await _geolocatorPlatform.openAppSettings();
    String displayValue;

    if (opened) {
      displayValue = 'Opened Application Settings.';
    } else {
      displayValue = 'Error opening Application Settings.';
    }

    _updatePositionList(
      type: PositionItemType.log,
      displayValue: displayValue,
    );
  }

  void openLocationSettings() async {
    final opened = await _geolocatorPlatform.openLocationSettings();
    String displayValue;

    if (opened) {
      displayValue = 'Opened Location Settings';
    } else {
      displayValue = 'Error opening Location Settings';
    }

    _updatePositionList(
      type: PositionItemType.log,
      displayValue: displayValue,
    );
  }
}
