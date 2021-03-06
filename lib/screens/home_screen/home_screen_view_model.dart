// ignore: unused_import
import 'dart:developer';

import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:redux/redux.dart';

class HomeScreenViewModel {
  final Color textColor;
  final Color panelColor;
  final bool isLoading;
  final bool useDarkMode;
  final bool useAnimatedBackgrounds;
  final int conditionsCode;
  final Function(int) weatherType;
  final Function refreshScreen;
  final bool isActiveWeatherAlerts;

  HomeScreenViewModel({
    @required this.isLoading,
    @required this.useDarkMode,
    @required this.useAnimatedBackgrounds,
    @required this.conditionsCode,
    @required this.weatherType,
    @required this.refreshScreen,
    @required this.isActiveWeatherAlerts,
    @required this.textColor,
    @required this.panelColor,
  });

  factory HomeScreenViewModel.create(Store<GlobalAppState> store) {
    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    WeatherType _weatherType(int code) {
      bool _isDay = store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.is_day;
      switch (code) {
        case 1000:
        case 1003:
          return _isDay ? WeatherType.sunny : WeatherType.sunnyNight;
          break;
        case 1006:
          return _isDay ? WeatherType.cloudy : WeatherType.cloudyNight;
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

    void _refreshScreen() {
      store.dispatch(
        FetchWeatherDataAction(
          index: _getActiveLocationIndex(),
          latitude:
              store.state.locationList[_getActiveLocationIndex()].latitude,
          longitude:
              store.state.locationList[_getActiveLocationIndex()].longitude,
        ),
      );
    }

    return HomeScreenViewModel(
      panelColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode.withOpacity(0.8)
          : bgColorLightMode.withOpacity(0.8),
      textColor: store.state.userSettings.useDarkMode ? white : black,
      isActiveWeatherAlerts: store.state
          .weatherDataList[_getActiveLocationIndex()].weatherAlerts.isNotEmpty,
      refreshScreen: _refreshScreen,
      conditionsCode: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition.code,
      isLoading: store.state.loadingStatus == LoadingStatus.Loading,
      useDarkMode: store.state.userSettings.useDarkMode,
      useAnimatedBackgrounds: store.state.userSettings.useAnimatedBackgrounds,
      weatherType: (code) => _weatherType(code),
    );
  }

  get activeIndex => null;

  get fetchingDataStyle => null;

  void dispatch(LoadLocalDataAction loadLocalDataAction) {}
}
