import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:fancy_weather/middleware/weather_middleware.dart' as Weather;
import 'package:fancy_weather/middleware/current_location_middleware.dart'
    as Location;
import 'package:fancy_weather/middleware/local_io_middleware.dart' as LocalIO;
import 'package:fancy_weather/middleware/user_settings_middleware.dart'
    as Settings;

List<Middleware<GlobalAppState>> buildGlobalAppStateMiddleware({
  @required WeatherAPI weatherApi,
}) {
  return [
    TypedMiddleware<GlobalAppState, FetchWeatherDataAction>(
        Weather.handleWeatherDataRequest(weatherApi)),
    TypedMiddleware<GlobalAppState, ToggleAnimatedBackgroundsAction>(
        Settings.handleToggleAnimatedBackgroundsRequest()),
    TypedMiddleware<GlobalAppState, ToggleDarkModeAction>(
        Settings.handleToggleDarkModeRequest()),
    TypedMiddleware<GlobalAppState, ChangeTempUnitsAction>(
        Settings.handleChangeTempUnitRequest()),
    TypedMiddleware<GlobalAppState, ChangeWindSpeedUnitsAction>(
        Settings.handleChangeWindSpeedUnitsRequest()),
    TypedMiddleware<GlobalAppState, ChangeAirPressureUnitsAction>(
        Settings.handleChangeAirPressureUnitsRequest()),
    TypedMiddleware<GlobalAppState, LoadLocalDataAction>(
        LocalIO.handleLoadLocalDataRequest()),
    TypedMiddleware<GlobalAppState, SaveLocalDataAction>(
        LocalIO.handleSaveLocalDataRequest()),
    TypedMiddleware<GlobalAppState, GrabCurrentCoordsAction>(
        Location.handleGetCurrentLocationRequest()),
  ];
}
