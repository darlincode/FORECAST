import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AirPressureCardViewModel {
  final Color panelColor;
  final Color textColor;
  final Color pointerColor;
  final TextStyle cardHeaderTextStyle;
  final TextStyle cardbodyTextStyle;
  final bool useDarkMode;
  final AirPressureUnits airPressureUnits;
  final double currentAirPressure;

  AirPressureCardViewModel({
    @required this.panelColor,
    @required this.textColor,
    @required this.pointerColor,
    @required this.cardHeaderTextStyle,
    @required this.cardbodyTextStyle,
    @required this.useDarkMode,
    @required this.airPressureUnits,
    @required this.currentAirPressure,
  });

  factory AirPressureCardViewModel.create(Store<GlobalAppState> store) {
    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
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
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.pressure_mb
                  .toDouble() *
              0.0295301;
          break;
        case AirPressureUnits.Atm:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.pressure_mb
                  .toDouble() /
              1013;
        // break;
      }
    }

    return AirPressureCardViewModel(
      textColor: store.state.userSettings.useDarkMode ? white : black,
      currentAirPressure: getAirPressure(),
      airPressureUnits: store.state.userSettings.airPressureUnits,
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
    );
  }
}
