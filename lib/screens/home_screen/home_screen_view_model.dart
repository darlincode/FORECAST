import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:redux/redux.dart';

class HomeScreenViewModel {
  final bool isLoading;
  final bool useDarkMode;
  final bool useAnimatedBackgrounds;
  final String tempUnits;
  final String windSpeedUnits;
  final String airPressureUnits;
  final String cityName;
  final String conditionsIconUrl;
  final String conditionsString;
  final int conditionsCode;
  final double currentTemp;
  final double currentRealfeel;
  final Function(int) weatherType;
  final Function refreshScreen;

  // final int activeLocationIndex;
  // final Function(SimpleLocation) handleAddLocation;
  // final Function(String) handleRemoveLocation;
  // final Function() handleClearLocations;
  // final SettingsStateRepository userSettings;
  // final WeatherStateRepository weatherData;
  // final double locationLatitude;
  // final double locationLongitude;

  HomeScreenViewModel({
    @required this.cityName,
    @required this.isLoading,
    @required this.currentTemp,
    @required this.currentRealfeel,
    @required this.tempUnits,
    @required this.airPressureUnits,
    @required this.windSpeedUnits,
    @required this.useDarkMode,
    @required this.useAnimatedBackgrounds,
    @required this.conditionsIconUrl,
    @required this.conditionsString,
    @required this.conditionsCode,
    @required this.weatherType,
    @required this.refreshScreen,
    // @required this.activeLocationIndex,
    // @required this.handleAddLocation,
    // @required this.handleRemoveLocation,
    // @required this.handleClearLocations,
    // @required this.userSettings,
    // @required this.weatherData,
    // @required this.locationLatitude,
    // @required this.locationLongitude,
  });

  factory HomeScreenViewModel.create(Store<GlobalAppState> store) {
    /// add methods here
    /// ie - grabWeatherData

    String getUnitsString() {
      switch (store.state.userSettings.tempUnits) {
        case TempUnits.C:
          return 'c';
          break;
        case TempUnits.F:
          return 'f';
          break;
        case TempUnits.K:
          return 'k';
          break;
      }
      return 'c';
    }

    // TempUnits getUnits() {
    //   return store.state.userSettings.tempUnits ?? TempUnits.C;
    // }

    WeatherType _weatherType(int code) {
      switch (code) {
        case 1000:
        case 1003:
          return DateTime.now().hour < 19
              ? WeatherType.sunny
              : WeatherType.sunnyNight;
          break;
        case 1006:
          return DateTime.now().hour < 19
              ? WeatherType.cloudy
              : WeatherType.cloudyNight;
          break;
        case 1009:
          return WeatherType.overcast;
          break;

        case 1030:
        case 1063:
        case 1150:
        case 1153:
        case 1180:
        case 1198:
        case 1240:
        case 1249:
          return WeatherType.lightRainy;
          break;
        case 1168:
        case 1186:
        case 1189:
        case 1243:
        case 1252:
          return WeatherType.middleRainy;
          break;
        case 1171:
        case 1192:
        case 1195:
        case 1201:
        case 1246:
          return WeatherType.heavyRainy;
          break;
        case 1066:
        case 1069:
        case 1072:
        case 1204:
        case 1210:
        case 1213:
        case 1237:
        case 1255:
        case 1261:
          return WeatherType.lightSnow;
          break;
        case 1114:
        case 1207:
        case 1216:
        case 1219:
        case 1258:
        case 1264:
          return WeatherType.middleSnow;
          break;
        case 1117:
        case 1222:
        case 1225:
          return WeatherType.heavySnow;
          break;
        case 1135:
        case 1147:
          return WeatherType.foggy;
          break;
        case 1087:
        case 1276:
        case 1279:
        case 1282:
          return WeatherType.thunder;
          break;
      }
      return null;
    }

    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    void _handleAddLocation(SimpleLocation location) {
      // store.dispatch(AddLocationToListAction(location));
    }

    void _handleRemoveLocation(String id) {
      // store.dispatch(RemoveLocationFromListAction(id));
    }

    void _handleClearLocations() {
      // store.dispatch(ClearLocationsAction());
    }

    double getCurrentTemp() {
      switch (store.state.userSettings.tempUnits) {
        case TempUnits.C:
          return store.state.weatherDataList[store.state.activeLocationIndex]
              .currentConditions.temp_c;
          break;
        case TempUnits.F:
          return store.state.weatherDataList[store.state.activeLocationIndex]
              .currentConditions.temp_f;
          break;
        case TempUnits.K:
          return store.state.weatherDataList[store.state.activeLocationIndex]
              .currentConditions.temp_k;
          break;
      }
      // fallback value, should never be visible
      return 1337.01;
    }

    double getCurrentRealfeel() {
      switch (store.state.userSettings.tempUnits ?? TempUnits.C) {
        case TempUnits.C:
          return store.state.weatherDataList[_getActiveLocationIndex()]
              .currentConditions.feelslike_c;
          break;
        case TempUnits.F:
          return store.state.weatherDataList[_getActiveLocationIndex()]
              .currentConditions.feelslike_f;
          break;
        case TempUnits.K:
          return store.state.weatherDataList[_getActiveLocationIndex()]
              .currentConditions.feelslike_k;
          break;
      }

      /// fallback value, should never be visible
      return 1337.01;
    }

    void _refreshScreen() {
      final int _index = _getActiveLocationIndex();

      store.dispatch(
        FetchWeatherDataAction(
          index: _index,
          latitude: store.state.locationList[_index].latitude,
          longitude: store.state.locationList[_index].longitude,
        ),
      );
    }

    return HomeScreenViewModel(
      refreshScreen: _refreshScreen,
      cityName:
          store.state.weatherDataList[_getActiveLocationIndex()].location.name,
      conditionsCode: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition.code,
      conditionsIconUrl: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition?.icon,
      conditionsString: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition.text,
      currentTemp: getCurrentTemp(),
      currentRealfeel: getCurrentRealfeel(),
      isLoading: store.state.loadingStatus == LoadingStatus.Loading,
      tempUnits: getUnitsString(),
      windSpeedUnits: getUnitsString(),
      airPressureUnits: getUnitsString(),
      useDarkMode: store.state.userSettings.useDarkMode,
      useAnimatedBackgrounds: store.state.userSettings.useAnimatedBackgrounds,
      weatherType: (code) => _weatherType(code),
      // activeLocationIndex: _getActiveLocationIndex(),
      // handleAddLocation: (location) => _handleAddLocation(location),
      // handleRemoveLocation: (id) => _handleRemoveLocation(id),
      // handleClearLocations: () => _handleClearLocations(),
      // locationLatitude: store.state.locationList[0].latitude,
      // locationLongitude: store.state.locationList[0].longitude,
      // userSettings: store.state.userSettings,
      // weatherData: store.state.weatherDataList[0],
    );
  }
}
