import 'dart:developer';

import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleGetCurrentLocationRequest() {
  return (store, action, next) async {
    Position _userPosition;

    // 1. set the app state as loading
    store.dispatch(SetLoadingStatusAction(LoadingStatus.Loading));

    // GetCurrentLocationAction _action = action;

    /// Determine the current position of the device.
    ///
    /// When the location services are not enabled or permissions
    /// are denied the `Future` will return an error.
    Future<Position> _determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        log('Location services are disabled.');
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          log('Location permissions are denied');
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        log('Location permissions are permanently denied, we cannot request permissions.');
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      // When we reach here, permissions are granted and we can
      // continue accessing the position of the device.
      return await Geolocator.getCurrentPosition();
    }

    // 2. Grab user's location with geolocator
    try {
      _userPosition = await _determinePosition();
    } catch (e) {
      log('Could not determine current location, using last known position');
      log('Error: $e');
      _userPosition = await Geolocator.getLastKnownPosition();
    }

    // 3. Update current user location (index 0) in locationList
    store.dispatch(ReplaceCoordsInLocationListAction(
      index: 0,
      latitude: _userPosition.latitude,
      longitude: _userPosition.longitude,
    ));

    // 4. Grab weather data using the new location
    store.dispatch(FetchWeatherDataAction(
      index: 0,
      latitude: _userPosition.latitude,
      longitude: _userPosition.longitude,
    ));
  };
}
