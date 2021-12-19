import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:fancy_weather/middleware/weather_middleware.dart' as weather;
import 'package:fancy_weather/middleware/navigation_middleware.dart'
    as navigation;

List<Middleware<GlobalAppState>> buildGlobalAppStateMiddleware({
  @required WeatherAPI weatherApi,
}) {
  return [
    TypedMiddleware<GlobalAppState, FetchWeatherDataAction>(
        weather.handleWeatherDataRequest(weatherApi)),
    TypedMiddleware<GlobalAppState, NavigateBodyAction>(
        navigation.buildHandleNavigateBodyAction()),
  ];
}

void saveToPrefs(GlobalAppState state) async {
  //
}

Future<GlobalAppState> loadFromPrefs(GlobalAppState state) async {
  //
}
