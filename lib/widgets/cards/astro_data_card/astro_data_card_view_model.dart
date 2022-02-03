import 'dart:developer';

import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:redux/redux.dart';

class AstroDataCardViewModel {
  final Color panelColor;
  final Color textColor;
  final Color pointerColor;
  final TextStyle cardHeaderTextStyle;
  final TextStyle cardbodyTextStyle;
  final String sunriseTime;
  final String sunsetTime;
  final int sunriseTimeMS;
  final int sunsetTimeMS;
  final int timeNowMS;
  final bool useDarkMode;
  final TextStyle timeStyle;

  AstroDataCardViewModel(
      {@required this.panelColor,
      @required this.textColor,
      @required this.pointerColor,
      @required this.cardHeaderTextStyle,
      @required this.cardbodyTextStyle,
      @required this.sunriseTime,
      @required this.sunsetTime,
      @required this.sunriseTimeMS,
      @required this.sunsetTimeMS,
      @required this.timeNowMS,
      @required this.timeStyle,
      @required this.useDarkMode});

  factory AstroDataCardViewModel.create(Store<GlobalAppState> store) {
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

    int _getSunriseTimeMS() {
      DateTime _now = DateTime.now();
      String _sunrise = store
          .state.weatherDataList[0].forecast.forecastday[0].astro.sunrise
          .substring(0, 5);
      var _t = TimeOfDay(
          hour: int.parse(_sunrise.split(":")[0]),
          minute: int.parse(_sunrise.split(":")[1]));
      DateTime _sunriseDt =
          DateTime(_now.year, _now.month, _now.day, _t.hour, _t.minute);
      log(_sunriseDt.toString());

      return _sunriseDt.millisecondsSinceEpoch;
    }

    int _getSunsetTimeMS() {
      DateTime _now = DateTime.now();
      String _sunsetString = store
          .state.weatherDataList[0].forecast.forecastday[0].astro.sunset
          .substring(0, 5);
      var _t = TimeOfDay(
          hour: int.parse(_sunsetString.split(":")[0]) + 12,
          minute: int.parse(_sunsetString.split(":")[1]));
      DateTime _sunsetDt =
          DateTime(_now.year, _now.month, _now.day, _t.hour, _t.minute);
      log(_sunsetDt.toString());

      return _sunsetDt.millisecondsSinceEpoch;
    }

    String _getSunsetTimeString() {
      String _timeString =
          store.state.weatherDataList[0].forecast.forecastday[0].astro.sunset;
      if (_timeString.startsWith('00')) {
        _timeString = _timeString.replaceFirst(RegExp(r'00'), '12');
        log(_timeString);
      } else if (_timeString.startsWith('0')) {
        _timeString = _timeString.replaceFirst(RegExp(r'0'), '');
        log(_timeString);
      }
      return _timeString;
      // return '';
    }

    String _getSunriseTimeString() {
      String _timeString =
          store.state.weatherDataList[0].forecast.forecastday[0].astro.sunrise;
      if (_timeString.startsWith('00')) {
        _timeString = _timeString.replaceFirst(RegExp(r'00'), '12');
        log(_timeString);
      } else if (_timeString.startsWith('0')) {
        _timeString = _timeString.replaceFirst(RegExp(r'0'), '');
        log(_timeString);
      }
      return _timeString;
    }

    return AstroDataCardViewModel(
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
      pointerColor: getPointerColor(),
      textColor: store.state.userSettings.useDarkMode ? white : black,
      useDarkMode: store.state.userSettings.useDarkMode,
      sunriseTime: _getSunriseTimeString(),
      sunsetTime: _getSunsetTimeString(),
      sunriseTimeMS: _getSunriseTimeMS(),
      sunsetTimeMS: _getSunsetTimeMS(),
      timeNowMS: DateTime.now().millisecondsSinceEpoch,
      timeStyle: TextStyle(
          fontSize: 12,
          color: store.state.userSettings.useDarkMode
              ? textColorDarkMode
              : textColorLightMode),
    );
  }
}
