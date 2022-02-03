import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class HourlyForecastCardViewModel {
  final Color panelColor;
  final Color textColor;
  final List<List<String>> hourlyConditionsIconURLs;
  final List<List<int>> hourlyChanceOfRain;
  final List<List<double>> hourlyTempsC;
  final List<List<double>> hourlyTempsF;
  final List<List<double>> hourlyTempsK;

  HourlyForecastCardViewModel({
    @required this.hourlyConditionsIconURLs,
    @required this.hourlyChanceOfRain,
    @required this.hourlyTempsC,
    @required this.hourlyTempsF,
    @required this.hourlyTempsK,
    @required this.textColor,
    @required this.panelColor,
  });

  factory HourlyForecastCardViewModel.create(Store<GlobalAppState> store) {
    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    List<List<String>> getHourlyConditionsIconURLs() {
      return [
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[0].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[1].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[2].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[3].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[4].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[5].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[6].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[7].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[8].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[9].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[10].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[11].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[12].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[13].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[14].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[15].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[16].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[17].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[18].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[19].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[20].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[21].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[22].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[23].condition.icon,
        ],
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[0].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[1].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[2].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[3].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[4].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[5].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[6].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[7].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[8].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[9].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[10].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[11].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[12].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[13].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[14].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[15].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[16].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[17].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[18].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[19].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[20].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[21].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[22].condition.icon,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[23].condition.icon,
        ],
      ];
    }

    List<List<int>> getHourlyChanceOfRain() {
      return [
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[0].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[1].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[2].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[3].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[4].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[5].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[6].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[7].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[8].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[9].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[10].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[11].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[12].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[13].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[14].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[15].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[16].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[17].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[18].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[19].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[20].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[21].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[22].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[23].chance_of_rain,
        ],
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[0].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[1].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[2].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[3].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[4].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[5].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[6].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[7].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[8].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[9].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[10].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[11].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[12].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[13].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[14].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[15].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[16].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[17].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[18].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[19].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[20].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[21].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[22].chance_of_rain,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[23].chance_of_rain,
        ],
      ];
    }

    List<List<double>> getHourlyTempsC() {
      return [
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[0].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[1].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[2].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[3].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[4].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[5].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[6].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[7].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[8].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[9].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[10].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[11].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[12].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[13].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[14].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[15].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[16].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[17].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[18].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[19].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[20].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[21].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[22].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[23].temp_c,
        ],
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[0].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[1].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[2].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[3].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[4].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[5].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[6].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[7].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[8].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[9].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[10].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[11].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[12].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[13].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[14].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[15].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[16].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[17].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[18].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[19].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[20].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[21].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[22].temp_c,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[23].temp_c,
        ],
      ];
    }

    List<List<double>> getHourlyTempsF() {
      return [
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[0].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[1].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[2].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[3].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[4].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[5].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[6].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[7].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[8].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[9].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[10].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[11].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[12].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[13].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[14].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[15].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[16].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[17].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[18].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[19].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[20].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[21].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[22].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[0].hour[23].temp_f,
        ],
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[0].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[1].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[2].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[3].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[4].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[5].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[6].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[7].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[8].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[9].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[10].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[11].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[12].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[13].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[14].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[15].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[16].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[17].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[18].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[19].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[20].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[21].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[22].temp_f,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
              .forecastday[1].hour[23].temp_f,
        ],
      ];
    }

    List<List<double>> getHourlyTempsK() {
      return [
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[0].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[1].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[2].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[3].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[4].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[5].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[6].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[7].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[8].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[9].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[10].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[11].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[12].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[13].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[14].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[15].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[16].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[17].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[18].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[19].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[20].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[21].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[22].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[0].hour[23].temp_c +
              273.15,
        ],
        [
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[0].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[1].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[2].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[3].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[4].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[5].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[6].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[7].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[8].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[9].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[10].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[11].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[12].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[13].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[14].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[15].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[16].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[17].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[18].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[19].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[20].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[21].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[22].temp_c +
              273.15,
          store.state.weatherDataList[_getActiveLocationIndex()].forecast
                  .forecastday[1].hour[23].temp_c +
              273.15,
        ],
      ];
    }

    return HourlyForecastCardViewModel(
      hourlyConditionsIconURLs: getHourlyConditionsIconURLs(),
      hourlyChanceOfRain: getHourlyChanceOfRain(),
      hourlyTempsC: getHourlyTempsC(),
      hourlyTempsF: getHourlyTempsF(),
      hourlyTempsK: getHourlyTempsK(),
      textColor: store.state.userSettings.useDarkMode ? white : black,
      panelColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode.withOpacity(0.45)
          : bgColorLightMode.withOpacity(0.45),
    );
  }
}
