import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class WindConditionsCardViewModel {
  final Color panelColor;
  final Color textColor;
  final Color pointerColor;
  final TextStyle cardHeaderTextStyle;
  final TextStyle cardbodyTextStyle;
  final bool useDarkMode;
  final double currentWindSpeed;
  final String currentWindDegreesString;
  final int currentWindDegrees;
  final String windSpeedUnits;

  WindConditionsCardViewModel({
    @required this.panelColor,
    @required this.textColor,
    @required this.pointerColor,
    @required this.cardHeaderTextStyle,
    @required this.cardbodyTextStyle,
    @required this.useDarkMode,
    @required this.currentWindSpeed,
    @required this.currentWindDegreesString,
    @required this.currentWindDegrees,
    @required this.windSpeedUnits,
  });
  factory WindConditionsCardViewModel.create(Store<GlobalAppState> store) {
    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    String getWindSpeedUnitsString() {
      switch (store.state.userSettings.windSpeedUnits) {
        case WindSpeedUnits.Kph:
          return 'km/h';
          break;
        case WindSpeedUnits.Mph:
          return 'mph';
          break;
        case WindSpeedUnits.Knots:
          return 'kts';
          break;
        case WindSpeedUnits.Ms:
          return 'm/s';
          break;
      }
      return 'c';
    }

    double getWindSpeed() {
      switch (store.state.userSettings.windSpeedUnits) {
        case WindSpeedUnits.Kph:
          return store.state.weatherDataList[_getActiveLocationIndex()]
              .currentConditions.wind_kph;
          break;
        case WindSpeedUnits.Mph:
          return store.state.weatherDataList[_getActiveLocationIndex()]
              .currentConditions.wind_mph;
          break;
        case WindSpeedUnits.Knots:
          return double.parse((store
                      .state
                      .weatherDataList[_getActiveLocationIndex()]
                      .currentConditions
                      .wind_kph /
                  1.852)
              .toStringAsFixed(1));
          break;
        case WindSpeedUnits.Ms:
          return double.parse((store
                      .state
                      .weatherDataList[_getActiveLocationIndex()]
                      .currentConditions
                      .wind_kph /
                  3.6)
              .toStringAsFixed(2));
          break;
        default:
          return 80085.0;
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

    return WindConditionsCardViewModel(
      pointerColor: getPointerColor(),
      cardHeaderTextStyle: cardHeaderStyle.copyWith(
          color: store.state.userSettings.useDarkMode
              ? textColorDarkMode
              : textColorLightMode),
      cardbodyTextStyle: cardBodyStyle.copyWith(
          color: store.state.userSettings.useDarkMode
              ? textColorDarkMode
              : textColorLightMode),
      useDarkMode: store.state.userSettings.useDarkMode,
      panelColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode.withOpacity(0.45)
          : bgColorLightMode.withOpacity(0.45),
      textColor: store.state.userSettings.useDarkMode ? white : black,
      windSpeedUnits: getWindSpeedUnitsString(),
      currentWindSpeed: getWindSpeed(),
      currentWindDegreesString: store
          .state
          .weatherDataList[_getActiveLocationIndex()]
          .currentConditions
          .wind_dir,
      currentWindDegrees: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.wind_degree,
    );
  }
}
