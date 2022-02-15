import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:location/location.dart';
import 'package:mausam/models/location_model.dart';
import 'package:mausam/services/weather_client.dart';
import 'package:mausam/views/controllers/current_weather_controller.dart';

class LocationClient with ChangeNotifier {
  LocationClient() {
    getLocation();
  }

  LocationModel lm = const LocationModel(lat: 0, lon: 0);

  Future<LocationModel> getLocation() => _fetchLocation();

  Future<LocationModel> _fetchLocation() async {
    debugPrint('fetch loc called');
    LocationData? _currentLocation;
    try {
      var location = Location();
      bool _serviceEnabled;
      PermissionStatus _permissionGranted;
      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          return Future.error("Location Service Disabled");
        }
      }
      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.denied) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.granted) {
          return Future.error("Location Permission Not Granted");
        }
      }
      _currentLocation = await location.getLocation();
      lm = LocationModel(
          lat: _currentLocation.latitude ?? 0.0,
          lon: _currentLocation.longitude ?? 0.0);
      tempLm = lm;
      notifyListeners();
      return lm;
    } finally {
      notifyListeners();
      debugPrint('Location Fetched, lat= ${_currentLocation?.latitude ?? 0}');
    }
  }
}

LocationModel tempLm = const LocationModel(lat: 0, lon: 0);
final locationClientProvider = FutureProvider<LocationModel>(
  (ref) async {
    // ref.watch(weatherRepositoryProvider);
    Future<LocationModel> _fetchLocation() async {
      debugPrint('fetch loc called');
      LocationData? _currentLocation;
      try {
        var location = Location();
        bool _serviceEnabled;
        PermissionStatus _permissionGranted;
        _serviceEnabled = await location.serviceEnabled();
        if (!_serviceEnabled) {
          _serviceEnabled = await location.requestService();
          if (!_serviceEnabled) {
            return Future.error("Location Service Disabled");
          }
        }
        _permissionGranted = await location.hasPermission();
        if (_permissionGranted == PermissionStatus.denied) {
          _permissionGranted = await location.requestPermission();
          if (_permissionGranted != PermissionStatus.granted) {
            return Future.error("Location Permission Not Granted");
          }
        }
        _currentLocation = await location.getLocation();
        var lm = LocationModel(
            lat: _currentLocation.latitude ?? 0.0,
            lon: _currentLocation.longitude ?? 0.0);
        // ref.refresh(locationClientProvider);//=lm as AsyncValue<LocationModel>;
        return lm;
      } finally {
        debugPrint('Location Fetched, lat= ${_currentLocation?.latitude ?? 0}');
      }
    }

    Future<LocationModel> getLocation() => _fetchLocation();
    return await getLocation();
  },
);
