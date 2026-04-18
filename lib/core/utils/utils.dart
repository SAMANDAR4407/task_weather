import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

Future<bool> _handleLocationPermission() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return false;
  }
  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return false;
    }
  }
  if (permission == LocationPermission.deniedForever) {
    return false;
  }
  return true;
}

Future<void> getCurrentPosition(Function(Position) update) async {
  final hasPermission = await _handleLocationPermission();
  if (!hasPermission) return;
  await Geolocator.getCurrentPosition(
      locationSettings: LocationSettings(accuracy: LocationAccuracy.high))
      .then((Position position) {
    update(position);
  }).catchError((e) {
    debugPrint(e);
  });
}

void networkLogging(Object? message) {
  if (kDebugMode) {
    print('HTTP: ${message.toString()}');
  }
}