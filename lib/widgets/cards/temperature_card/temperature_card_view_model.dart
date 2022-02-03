import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class TemperatureCardViewModel {
  final Color panelColor;
  final Color textColor;
  final String cityName;
  final String conditionsIconUrl;
  final String conditionsString;
  final double currentTemp;
  final double currentRealfeel;
  final String tempUnits;

  TemperatureCardViewModel({
    @required this.panelColor,
    @required this.textColor,
    @required this.cityName,
    @required this.conditionsIconUrl,
    @required this.conditionsString,
    @required this.currentTemp,
    @required this.currentRealfeel,
    @required this.tempUnits,
  });

  factory TemperatureCardViewModel.create(Store<GlobalAppState> store) {
    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    double getCurrentTemp() {
      switch (store.state.userSettings.tempUnits) {
        case TempUnits.C:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.temp_c ??
              0;
          break;
        case TempUnits.F:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.temp_f ??
              0;
          break;
        case TempUnits.K:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.temp_k ??
              (store.state.weatherDataList[_getActiveLocationIndex()]
                          .currentConditions.temp_c +
                      273.15 ??
                  0);
          break;
      }
      // fallback value, should never be visible
      return 80085.0;
    }

    double getCurrentRealfeel() {
      switch (store.state.userSettings.tempUnits ?? TempUnits.C) {
        case TempUnits.C:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.feelslike_c ??
              0;
          break;
        case TempUnits.F:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.feelslike_f ??
              0;
          break;
        case TempUnits.K:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.feelslike_k ??
              (store.state.weatherDataList[_getActiveLocationIndex()]
                          .currentConditions.feelslike_c +
                      273.15 ??
                  0);
          break;
      }

      /// fallback value, should never be visible
      return 80085.0;
    }

    String getTempUnitsString() {
      switch (store.state.userSettings.tempUnits) {
        case TempUnits.C:
          return 'c';
          break;
        case TempUnits.F:
          return 'F';
          break;
        case TempUnits.K:
          return 'K';
          break;
      }
      return 'c';
    }

    return TemperatureCardViewModel(
      panelColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode.withOpacity(0.45)
          : bgColorLightMode.withOpacity(0.45),
      textColor: store.state.userSettings.useDarkMode ? white : black,
      cityName:
          store.state.weatherDataList[_getActiveLocationIndex()].location.name,
      conditionsIconUrl: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition.icon,
      conditionsString: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition.text,
      currentTemp: getCurrentTemp(),
      currentRealfeel: getCurrentRealfeel(),
      tempUnits: getTempUnitsString(),
    );
  }
}
