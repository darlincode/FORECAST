import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:geolocator/geolocator.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleGetCurrentLocationRequest() =>
    (Store<GlobalAppState> store, action, NextDispatcher next) async {
      double _currentLatitude;
      double _currentLongitude;
      Location _userLocation;
      Position _userPosition;

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
            return Future.error('Location permissions are denied');
          }
        }

        if (permission == LocationPermission.deniedForever) {
          // Permissions are denied forever, handle appropriately.
          return Future.error(
              'Location permissions are permanently denied, we cannot request permissions.');
        }

        // When we reach here, permissions are granted and we can
        // continue accessing the position of the device.
        return await Geolocator.getCurrentPosition();
      }

      // 1. set the app state as loading
      store.dispatch(SetLoadingStatusAction(LoadingStatus.Loading));

      // 2. Grab user's location using geolocator
      if (store.state.connectionStatus == ConnectionStatus.Online) {
        _userPosition = await _determinePosition();
      } else {
        _userPosition = await Geolocator.getLastKnownPosition();
      }

      // 2a. Get latitude and longitude
      _currentLatitude = _userPosition.latitude;
      _currentLongitude = _userPosition.longitude;

      // 3. Update _userLocation using gathered data
      _userLocation = Location(
        latitude: _currentLatitude,
        longitude: _currentLongitude,
      );

      // 4. Use if check to see if user location has changed
      if (_userLocation != store.state.currentLocInfo) {
        // 5. Update the store with the new location
        store.dispatch(SetCurrentLocationAction(_userLocation));
        // 6. FetchWeatherData with new user location
        store.dispatch(FetchWeatherDataAction(_userLocation));
      } else {
        store.dispatch(SetCurrentLocationAction(store.state.currentLocInfo));
        store.dispatch(FetchWeatherDataAction(store.state.currentLocInfo));
      }
    };
