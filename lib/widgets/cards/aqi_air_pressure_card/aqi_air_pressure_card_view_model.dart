import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

@immutable
class AQIAirPressureCardViewModel {
  final Color panelColor, textColor, pointerColor;
  final TextStyle cardHeaderTextStyle, cardbodyTextStyle;
  final bool useDarkMode;
  final AQIUnits aqiUnits;
  final int currentAQI;
  final AirPressureUnits airPressureUnits;
  final String aqiString, airPressureUnitsString;
  final double currentAirPressure, airPressureMin, airPressureMax, aqiMaxValue;

  AQIAirPressureCardViewModel({
    @required this.panelColor,
    @required this.textColor,
    @required this.pointerColor,
    @required this.cardHeaderTextStyle,
    @required this.cardbodyTextStyle,
    @required this.useDarkMode,
    @required this.aqiUnits,
    @required this.aqiMaxValue,
    @required this.currentAQI,
    @required this.airPressureUnits,
    @required this.currentAirPressure,
    @required this.airPressureUnitsString,
    @required this.aqiString,
    @required this.airPressureMin,
    @required this.airPressureMax,
  });

  factory AQIAirPressureCardViewModel.create(Store<GlobalAppState> store) {
    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    int getAQI() {
      if (store.state.userSettings.aqiUnits == AQIUnits.US) {
        return store.state.weatherDataList[_getActiveLocationIndex()]
            .currentConditions.air_quality.us_epa_index;
      } else {
        return store.state.weatherDataList[_getActiveLocationIndex()]
            .currentConditions.air_quality.gb_defra_index;
      }
    }

    // ignore: missing_return
    Color getPointerColor() {
      bool _useBG = store.state.userSettings.useAnimatedBackgrounds;
      bool _useDM = store.state.userSettings.useDarkMode;

      if (_useDM && _useBG) {
        return Colors.white;
      } else if (_useDM && !_useBG) {
        return Colors.white;
      } else if (!_useDM && _useBG) {
        return Colors.white;
      } else if (!_useDM && !_useBG) {
        return Colors.black;
      }
    }

    // ignore: missing_return
    double getAirPressure() {
      switch (store.state.userSettings.airPressureUnits) {
        case AirPressureUnits.Mbar:
          return store.state.weatherDataList[_getActiveLocationIndex()]
              .currentConditions.pressure_mb
              .toDouble();
          break;
        case AirPressureUnits.Kpa:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.pressure_mb
                  .toDouble() /
              10;
          break;
        case AirPressureUnits.Inch:
          return double.parse((store
                      .state
                      .weatherDataList[_getActiveLocationIndex()]
                      .currentConditions
                      .pressure_mb *
                  0.0295301)
              .toStringAsFixed(2));
          break;
        case AirPressureUnits.Atm:
          return double.parse((store
                      .state
                      .weatherDataList[_getActiveLocationIndex()]
                      .currentConditions
                      .pressure_mb /
                  1013)
              .toStringAsFixed(2));
          break;
      }
    }

    // ignore: missing_return
    String getAqiString() {
      if (store.state.userSettings.aqiUnits == AQIUnits.US) {
        // us epa index
        switch (store.state.weatherDataList[_getActiveLocationIndex()]
            .currentConditions.air_quality.us_epa_index) {
          case 1:
            return 'Good';
            break;
          case 2:
            return 'Moderate';
            break;
          case 3:
            return 'Unhealthy for Sensitive';
            break;
          case 4:
            return 'Unhealthy';
            break;
          case 5:
            return 'Very Unhealthy';
            break;
          case 6:
            return 'Hazardous';
            break;
        }
      } else {
        // gb defra index
        switch (store.state.weatherDataList[_getActiveLocationIndex()]
            .currentConditions.air_quality.gb_defra_index) {
          case 1:
          case 2:
          case 3:
            return 'Low';
            break;
          case 4:
          case 5:
          case 6:
            return 'Moderate';
            break;
          case 7:
          case 8:
          case 9:
            return 'High';
            break;
          case 10:
            return 'Very High';
            break;
        }
      }
    }

    // ignore: missing_return
    double getAirPressureMin() {
      switch (store.state.userSettings.airPressureUnits) {
        case AirPressureUnits.Mbar:
          return 970;
          break;
        case AirPressureUnits.Kpa:
          return 97;
          break;
        case AirPressureUnits.Inch:
          return 28;
          break;
        case AirPressureUnits.Atm:
          return 0;
          break;
      }
    }

    // ignore: missing_return
    String getAirPressureUnitsString() {
      switch (store.state.userSettings.airPressureUnits) {
        case AirPressureUnits.Mbar:
          return 'mbar';
          break;
        case AirPressureUnits.Kpa:
          return 'kPa';
          break;
        case AirPressureUnits.Inch:
          return 'inHg';
          break;
        case AirPressureUnits.Atm:
          return 'ATM';
          break;
      }
    }

    // ignore: missing_return
    double getAirPressureMax() {
      switch (store.state.userSettings.airPressureUnits) {
        case AirPressureUnits.Mbar:
          return 1100;
          break;
        case AirPressureUnits.Kpa:
          return 110;
          break;
        case AirPressureUnits.Inch:
          return 33;
          break;
        case AirPressureUnits.Atm:
          return 2;
          break;
      }
    }

    return AQIAirPressureCardViewModel(
      textColor: store.state.userSettings.useDarkMode ? white : black,
      currentAQI: getAQI(),
      aqiUnits: store.state.userSettings.aqiUnits,
      pointerColor: getPointerColor(),
      useDarkMode: store.state.userSettings.useDarkMode,
      cardHeaderTextStyle: cardHeaderStyle.copyWith(
          color: store.state.userSettings.useDarkMode
              ? textColorDarkMode
              : textColorLightMode),
      cardbodyTextStyle: cardBodyStyle.copyWith(
          color: store.state.userSettings.useDarkMode
              ? textColorDarkMode
              : textColorLightMode),
      panelColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode.withOpacity(0.45)
          : bgColorLightMode.withOpacity(0.45),
      currentAirPressure: getAirPressure(),
      airPressureUnits: store.state.userSettings.airPressureUnits,
      aqiMaxValue: store.state.userSettings.aqiUnits == AQIUnits.US ? 6 : 10,
      aqiString: getAqiString(),
      airPressureMin: getAirPressureMin(),
      airPressureMax: getAirPressureMax(),
      airPressureUnitsString: getAirPressureUnitsString(),
    );
  }
}
