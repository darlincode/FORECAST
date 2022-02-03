import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class AQICardViewModel {
  final Color panelColor;
  final Color textColor;
  final Color pointerColor;
  final TextStyle cardHeaderTextStyle;
  final TextStyle cardbodyTextStyle;
  final bool useDarkMode;
  final AQIUnits aqiUnits;
  final int currentAQI;

  AQICardViewModel({
    @required this.panelColor,
    @required this.textColor,
    @required this.pointerColor,
    @required this.cardHeaderTextStyle,
    @required this.cardbodyTextStyle,
    @required this.useDarkMode,
    @required this.aqiUnits,
    @required this.currentAQI,
  });

  factory AQICardViewModel.create(Store<GlobalAppState> store) {
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

    return AQICardViewModel(
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
    );
  }
}
