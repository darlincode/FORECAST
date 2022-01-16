import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:fancy_weather/middleware/weather_middleware.dart' as Weather;
// import 'package:fancy_weather/middleware/navigation_middleware.dart'
//     as Navigation;
import 'package:fancy_weather/middleware/current_location_middleware.dart'
    as Location;

List<Middleware<GlobalAppState>> buildGlobalAppStateMiddleware({
  @required WeatherAPI weatherApi,
}) {
  return [
    TypedMiddleware<GlobalAppState, FetchWeatherDataAction>(
        Weather.handleWeatherDataRequest(weatherApi)),
    TypedMiddleware<GlobalAppState, ToggleAnimatedBackgroundsAction>(
        _handleToggleAnimatedBackgroundsRequest()),
    TypedMiddleware<GlobalAppState, ToggleDarkModeAction>(
        _handleToggleDarkModeRequest()),
    // TypedMiddleware<GlobalAppState, LoadLocalDataAction>(
    //     handleLoadDataRequest()),
    // TypedMiddleware<GlobalAppState, GrabCurrentLocationAction>(
    //     Location.handleGetCurrentLocationRequest()),
  ];
}

Middleware<GlobalAppState> _handleToggleAnimatedBackgroundsRequest() {
  return TypedMiddleware<GlobalAppState, ToggleAnimatedBackgroundsAction>(
      (store, action, next) {
    store.dispatch(
      UpdateUserSettingsAction(
        store.state.userSettings.copyWith(
          useAnimatedBackgrounds:
              !store.state.userSettings.useAnimatedBackgrounds,
        ),
      ),
    );
  });
}

Middleware<GlobalAppState> _handleToggleDarkModeRequest() {
  return TypedMiddleware<GlobalAppState, ToggleDarkModeAction>(
      (Store<GlobalAppState> store, ToggleDarkModeAction action,
          NextDispatcher next) {
    store.dispatch(
      UpdateUserSettingsAction(
        store.state.userSettings.copyWith(
          useDarkMode: !store.state.userSettings.useDarkMode,
        ),
      ),
    );
  });
}

// Middleware<GlobalAppState> handleLoadDataRequest() {
//   return TypedMiddleware<GlobalAppState, LoadLocalDataAction>(
//       (store, action, next) {
//     /// Check for local data
//     /// if not found, treat as first run
//     /// grab user location
//     try {
//       // loadLocalData();
//     } catch (e) {
//       /// No local data available - treat as first run.
//       /// 1. Grab User Coords
//       dynamic _currentLoc = handleGrabCurrentCoordinates();

//       /// 2. Save coords to userSettings.locationList[0]
//       store.dispatch(
//           AddLocationToSimpleListAction(_currentLoc.lat, _currentLoc.long));

//       /// 3. Grab Weather data using coords
//       store.dispatch(FetchWeatherDataAction(index: 0));

//       /// 4. Save weather data to weatherLocationList[0]?
//     }

//     /// 5. Fire reducer to refresh UI
//   });
// }

// void saveToPrefs(GlobalAppState state) async {
//   //
// }

// Future<GlobalAppState> loadFromPrefs(GlobalAppState state) async {
//   //
// }
