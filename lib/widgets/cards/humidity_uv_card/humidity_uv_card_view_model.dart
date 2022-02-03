import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class HumidityUVCardViewModel {
  final Color panelColor;
  final Color textColor;
  final Color pointerColor;
  final TextStyle cardHeaderTextStyle;
  final TextStyle cardbodyTextStyle;
  final bool useDarkMode;
  final int currentUV;
  final int currentHumidity;

  HumidityUVCardViewModel({
    @required this.panelColor,
    @required this.textColor,
    @required this.pointerColor,
    @required this.cardHeaderTextStyle,
    @required this.cardbodyTextStyle,
    @required this.useDarkMode,
    @required this.currentUV,
    @required this.currentHumidity,
  });

  factory HumidityUVCardViewModel.create(Store<GlobalAppState> store) {
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

    return HumidityUVCardViewModel(
        cardHeaderTextStyle: cardHeaderStyle.copyWith(
            color: store.state.userSettings.useDarkMode
                ? textColorDarkMode
                : textColorLightMode),
        cardbodyTextStyle: cardBodyStyle.copyWith(
            color: store.state.userSettings.useDarkMode
                ? textColorDarkMode
                : textColorLightMode),
        currentHumidity: store.state.weatherDataList[_getActiveLocationIndex()]
            .currentConditions.humidity,
        currentUV: store.state.weatherDataList[_getActiveLocationIndex()]
            .currentConditions.uv,
        panelColor: store.state.userSettings.useDarkMode
            ? bgColorDarkMode.withOpacity(0.45)
            : bgColorLightMode.withOpacity(0.45),
        pointerColor: getPointerColor(),
        textColor: store.state.userSettings.useDarkMode ? white : black,
        useDarkMode: store.state.userSettings.useDarkMode);
  }
}
