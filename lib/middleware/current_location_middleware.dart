import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleGetCurrentLocationRequest() =>
    (Store<GlobalAppState> store, action, NextDispatcher next) async {
      // 1. set the app state as loading
      store.dispatch(SetLoadingStatusAction(LoadingStatus.Loading));

      double _currentLatitude;
      double _currentLongitude;
      String _cityName;
      Location _userLocation;

      // 2. Grab user's location using geolocator
      // TODO: Implement geolocator
      // 2a. Get latitude and longitude
      _currentLatitude = 0;
      _currentLongitude = 0;
      // 2b. Get cityName
      _cityName = '';

      // 3. Update _userLocation using gathered data
      _userLocation = Location(
        latitude: _currentLatitude,
        longitude: _currentLongitude,
        cityName: _cityName,
        isActive: true,
      );

      // 4. Use if check to see if user location has changed
      if (_userLocation != store.state.currentLocInfo) {
        // 5. Update the store with the new location
        store.dispatch(SetCurrentLocationAction(_userLocation));
        // 6. FetchWeatherData with new user location
        store.dispatch(FetchWeatherDataAction(_userLocation));
      } else {
        // store.dispatch(SetCurrentLocationAction(store.state.currentLocInfo));
        // store.dispatch(FetchWeatherDataAction(store.state.currentLocInfo));
      }
    };
