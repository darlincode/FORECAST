import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class DailyForecastCardViewModel {
  final Color panelColor;
  final Color textColor;
  final Color pointerColor;
  final TextStyle cardHeaderTextStyle;
  final TextStyle cardbodyTextStyle;
  final bool useDarkMode;

  final List<double> dailyHighTempsC;
  final List<double> dailyHighTempsF;
  final List<double> dailyHighTempsK;
  final List<double> dailyLowTempsC;
  final List<double> dailyLowTempsF;
  final List<double> dailyLowTempsK;
  final List<int> dailyChanceOfRain;
  final List<String> dailyConditionsIconURLs;

  DailyForecastCardViewModel({
    @required this.dailyHighTempsC,
    @required this.dailyHighTempsF,
    @required this.dailyHighTempsK,
    @required this.dailyLowTempsC,
    @required this.dailyLowTempsF,
    @required this.dailyLowTempsK,
    @required this.dailyChanceOfRain,
    @required this.dailyConditionsIconURLs,
    @required this.cardHeaderTextStyle,
    @required this.cardbodyTextStyle,
    @required this.textColor,
    @required this.panelColor,
    @required this.pointerColor,
    @required this.useDarkMode,
  });

  factory DailyForecastCardViewModel.create(Store<GlobalAppState> store) {
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

    List<double> getDailyHighTempsC() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[0].day.maxtemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[1].day.maxtemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[2].day.maxtemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[3].day.maxtemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[4].day.maxtemp_c,
      ];
    }

    List<double> getDailyLowTempsC() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[0].day.mintemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[1].day.mintemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[2].day.mintemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[3].day.mintemp_c,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[4].day.mintemp_c,
      ];
    }

    List<double> getDailyHighTempsF() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[0].day.maxtemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[1].day.maxtemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[2].day.maxtemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[3].day.maxtemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[4].day.maxtemp_f,
      ];
    }

    List<double> getDailyLowTempsF() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[0].day.mintemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[1].day.mintemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[2].day.mintemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[3].day.mintemp_f,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[4].day.mintemp_f,
      ];
    }

    List<double> getDailyHighTempsK() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[0].day.maxtemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[1].day.maxtemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[2].day.maxtemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[3].day.maxtemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[4].day.maxtemp_c +
            273.15,
      ];
    }

    List<double> getDailyLowTempsK() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[0].day.mintemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[1].day.mintemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[2].day.mintemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[3].day.mintemp_c +
            273.15,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
                .forecastday[4].day.mintemp_c +
            273.15,
      ];
    }

    List<int> getDailyChanceOfRain() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[0].day.daily_chance_of_rain,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[1].day.daily_chance_of_rain,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[2].day.daily_chance_of_rain,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[3].day.daily_chance_of_rain,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[4].day.daily_chance_of_rain,
      ];
    }

    List<String> getDailyConditionsIconURLs() {
      return [
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[0].day.condition.icon,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[1].day.condition.icon,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[2].day.condition.icon,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[3].day.condition.icon,
        store.state.weatherDataList[_getActiveLocationIndex()].forecast
            .forecastday[4].day.condition.icon,
      ];
    }

    return DailyForecastCardViewModel(
      pointerColor: getPointerColor(),
      dailyHighTempsC: getDailyHighTempsC(),
      dailyHighTempsF: getDailyHighTempsF(),
      dailyHighTempsK: getDailyHighTempsK(),
      dailyLowTempsC: getDailyLowTempsC(),
      dailyLowTempsF: getDailyLowTempsF(),
      dailyLowTempsK: getDailyLowTempsK(),
      dailyChanceOfRain: getDailyChanceOfRain(),
      dailyConditionsIconURLs: getDailyConditionsIconURLs(),
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
      textColor: store.state.userSettings.useDarkMode ? white : black,
      useDarkMode: store.state.userSettings.useDarkMode,
    );
  }
}
