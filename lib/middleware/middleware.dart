import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:fancy_weather/middleware/weather_middleware.dart' as Weather;
import 'package:fancy_weather/middleware/navigation_middleware.dart'
    as Navigation;

List<Middleware<GlobalAppState>> buildGlobalAppStateMiddleware({
  @required WeatherAPI weatherApi,
}) {
  return [
    TypedMiddleware<GlobalAppState, FetchWeatherDataAction>(
        Weather.handleWeatherDataRequest(weatherApi)),
    TypedMiddleware<GlobalAppState, NavigateBodyAction>(
        Navigation.buildHandleNavigateBodyAction()),
  ];
}
