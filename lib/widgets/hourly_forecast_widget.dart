import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class HourlyForecastWidget extends StatelessWidget {
  final List forecastHours;
  final List hourlyConditionIcons;
  final List hourlyTemp;
  final List hourlyChanceOfRain;
  final bool useDarkMode;

  HourlyForecastWidget({
    required this.forecastHours,
    required this.hourlyTemp,
    required this.hourlyConditionIcons,
    required this.hourlyChanceOfRain,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    double lowestTemp = 200;
    hourlyTemp.forEach((element) {
      if (element < lowestTemp) {
        lowestTemp = element;
      }
    });
    double highestTemp = 0;
    hourlyTemp.forEach((element) {
      if (element > highestTemp) {
        highestTemp = element;
      }
    });

    String timeNow = '';
    int temp = DateTime.now().hour;
    if (temp == 0) {
      timeNow = '12 AM';
    } else if (temp < 12) {
      timeNow = '$temp AM';
    } else if (temp == 12) {
      timeNow = '12 PM';
    } else if (temp > 12) {
      timeNow = '${temp - 12} PM';
    }

    String nowPlusThreeHours = '';
    temp = DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch + 10800000)
        .hour;
    if (temp == 0) {
      nowPlusThreeHours = '12 AM';
    } else if (temp > 24) {
      nowPlusThreeHours = '${temp - 24} AM';
    } else if (temp < 12) {
      nowPlusThreeHours = '$temp AM';
    } else if (temp == 12) {
      nowPlusThreeHours = '12 PM';
    } else if (temp > 12) {
      nowPlusThreeHours = '${temp - 12} PM';
    }

    String nowPlusSixHours = '';
    temp = DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch + 10800000 * 2)
        .hour;
    if (temp == 0) {
      nowPlusSixHours = '12 AM';
    } else if (temp > 24) {
      nowPlusSixHours = '${temp - 24} AM';
    } else if (temp < 12) {
      nowPlusSixHours = '$temp AM';
    } else if (temp == 12) {
      nowPlusSixHours = '12 PM';
    } else if (temp > 12) {
      nowPlusSixHours = '${temp - 12} PM';
    }

    String nowPlusNineHours = '';
    temp = DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch + 10800000 * 3)
        .hour;
    if (temp == 0) {
      nowPlusNineHours = '12 AM';
    } else if (temp > 24) {
      nowPlusNineHours = '${temp - 24} AM';
    } else if (temp < 12) {
      nowPlusNineHours = '$temp AM';
    } else if (temp == 12) {
      nowPlusNineHours = '12 PM';
    } else if (temp > 12) {
      nowPlusNineHours = '${temp - 12} PM';
    }

    String nowPlusTwelveHours = '';
    temp = DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch + 10800000 * 4)
        .hour;
    if (temp == 0) {
      nowPlusTwelveHours = '12 AM';
    } else if (temp > 24) {
      nowPlusTwelveHours = '${temp - 24} AM';
    } else if (temp < 12) {
      nowPlusTwelveHours = '$temp AM';
    } else if (temp == 12) {
      nowPlusTwelveHours = '12 PM';
    } else if (temp > 12) {
      nowPlusTwelveHours = '${temp - 12} PM';
    }

    String nowPlusFifteenHours = '';
    temp = DateTime.fromMillisecondsSinceEpoch(
            DateTime.now().millisecondsSinceEpoch + 10800000 * 5)
        .hour;
    if (temp == 0) {
      nowPlusFifteenHours = '12 AM';
    } else if (temp > 24) {
      nowPlusFifteenHours = '${temp - 24} AM';
    } else if (temp < 12) {
      nowPlusFifteenHours = '$temp AM';
    } else if (temp == 12) {
      nowPlusFifteenHours = '12 PM';
    } else if (temp > 12) {
      nowPlusFifteenHours = '${temp - 12} PM';
    }

    final double _sw = MediaQuery.of(context).size.width;

    final List hourlyDataSeries = [
      HourlyData(
        hour: DateTime.fromMillisecondsSinceEpoch(forecastHours[0] * 1000),
        temp: hourlyTemp[0].toInt(),
      ),
      HourlyData(
        hour: DateTime.fromMillisecondsSinceEpoch(forecastHours[1] * 1000),
        temp: hourlyTemp[1].toInt(),
      ),
      HourlyData(
        hour: DateTime.fromMillisecondsSinceEpoch(forecastHours[2] * 1000),
        temp: hourlyTemp[2].toInt(),
      ),
      HourlyData(
        hour: DateTime.fromMillisecondsSinceEpoch(forecastHours[3] * 1000),
        temp: hourlyTemp[3].toInt(),
      ),
      HourlyData(
        hour: DateTime.fromMillisecondsSinceEpoch(forecastHours[4] * 1000),
        temp: hourlyTemp[4].toInt(),
      ),
      HourlyData(
        hour: DateTime.fromMillisecondsSinceEpoch(forecastHours[5] * 1000),
        temp: hourlyTemp[5].toInt(),
      ),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: _sw,
        child: Column(
          children: [
            Text(
              'HOURLY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 24, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        timeNow,
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      CachedNetworkImage(
                        imageUrl: hourlyConditionIcons[0],
                        width: 40,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/water_drop2.png',
                            height: 12,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${hourlyChanceOfRain[0]} %',
                            style: TextStyle(
                              color: useDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        nowPlusThreeHours,
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      CachedNetworkImage(
                        imageUrl: hourlyConditionIcons[1],
                        width: 40,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/water_drop2.png',
                            height: 12,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${hourlyChanceOfRain[1]} %',
                            style: TextStyle(
                              color: useDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        nowPlusSixHours,
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      CachedNetworkImage(
                        imageUrl: hourlyConditionIcons[2],
                        width: 40,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/water_drop2.png',
                            height: 12,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${hourlyChanceOfRain[2]} %',
                            style: TextStyle(
                              color: useDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        nowPlusNineHours,
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      CachedNetworkImage(
                        imageUrl: hourlyConditionIcons[3],
                        width: 40,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/water_drop2.png',
                            height: 12,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${hourlyChanceOfRain[3]} %',
                            style: TextStyle(
                              color: useDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        nowPlusTwelveHours,
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      CachedNetworkImage(
                        imageUrl: hourlyConditionIcons[4],
                        width: 40,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/water_drop2.png',
                            height: 12,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${hourlyChanceOfRain[4]} %',
                            style: TextStyle(
                              color: useDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        nowPlusFifteenHours,
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      SizedBox(height: 4),
                      CachedNetworkImage(
                        imageUrl: hourlyConditionIcons[5],
                        width: 40,
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/water_drop2.png',
                            height: 12,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                          SizedBox(width: 4),
                          Text(
                            '${hourlyChanceOfRain[5]} %',
                            style: TextStyle(
                              color: useDarkMode ? Colors.white : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 160,
              child: SfCartesianChart(
                plotAreaBorderWidth: 0,
                primaryYAxis: NumericAxis(
                  labelStyle: TextStyle(
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                  minimum: lowestTemp.round() - 3,
                  maximum: highestTemp.round() + 3,
                ),
                primaryXAxis: DateTimeCategoryAxis(
                  rangePadding: ChartRangePadding.round,
                  isVisible: false,
                ),
                series: [
                  SplineSeries(
                    splineType: SplineType.monotonic,
                    dataSource: hourlyDataSeries,
                    color: Colors.deepPurple,
                    xValueMapper: (dynamic data, _) => data.hour,
                    yValueMapper: (dynamic data, _) => data.temp,
                    markerSettings: MarkerSettings(
                      isVisible: true,
                      height: 4,
                      width: 4,
                    ),
                    dataLabelSettings: DataLabelSettings(
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.bottom,
                      textStyle: TextStyle(
                        color: useDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HourlyData {
  final DateTime hour;
  final int temp;

  HourlyData({
    required this.hour,
    required this.temp,
  });
}
