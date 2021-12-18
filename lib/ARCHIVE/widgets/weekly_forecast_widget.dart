import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WeeklyForecastWidget extends StatelessWidget {
  final int day;
  final List<int> dailyHighs;
  final List<int> dailyLows;
  final List<String> dailyIcons;
  final List<int> dailyChanceofRain;
  final bool useDarkMode;

  WeeklyForecastWidget({
    required this.day,
    required this.dailyHighs,
    required this.dailyLows,
    required this.dailyIcons,
    required this.dailyChanceofRain,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    int lowestTemp = 200;
    dailyLows.forEach((element) {
      if (element < lowestTemp) {
        lowestTemp = element;
      }
    });
    int highestTemp = 0;
    dailyHighs.forEach((element) {
      if (element > highestTemp) {
        highestTemp = element;
      }
    });

    final double _sw = MediaQuery.of(context).size.width;
    List<String> days = [];

    switch (day) {
      case 1:
        days = ['Today', 'Tue', 'Wed', 'Thu', 'Fri'];
        break;
      case 2:
        days = ['Today', 'Wed', 'Thu', 'Fri', 'Sat'];
        break;
      case 3:
        days = ['Today', 'Thu', 'Fri', 'Sat', 'Sun'];
        break;
      case 4:
        days = ['Today', 'Fri', 'Sat', 'Sun', 'Mon'];
        break;
      case 5:
        days = ['Today', 'Sat', 'Sun', 'Mon', 'Tue'];
        break;
      case 6:
        days = ['Today', 'Sun', 'Mon', 'Tue', 'Wed'];
        break;
      case 7:
        days = ['Today', 'Mon', 'Tue', 'Wed', 'Thu'];
        break;
    }

    final List<DailyTemp> dailyHighSeries = [
      DailyTemp(day: days[0], temp: dailyHighs[0]),
      DailyTemp(day: days[1], temp: dailyHighs[1]),
      DailyTemp(day: days[2], temp: dailyHighs[2]),
      DailyTemp(day: days[3], temp: dailyHighs[3]),
      DailyTemp(day: days[4], temp: dailyHighs[4]),
    ];

    final List<DailyTemp> dailyLowSeries = [
      DailyTemp(day: days[0], temp: dailyLows[0]),
      DailyTemp(day: days[1], temp: dailyLows[1]),
      DailyTemp(day: days[2], temp: dailyLows[2]),
      DailyTemp(day: days[3], temp: dailyLows[3]),
      DailyTemp(day: days[4], temp: dailyLows[4]),
    ];

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Container(
        width: _sw,
        child: Column(
          children: [
            Text(
              'WEEKLY',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 48.0, right: 32, bottom: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(
                        days[0],
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      CachedNetworkImage(imageUrl: dailyIcons[0], width: 40),
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
                            '${dailyChanceofRain[0]} %',
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
                        days[1],
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      CachedNetworkImage(imageUrl: dailyIcons[1], width: 40),
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
                            '${dailyChanceofRain[1]} %',
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
                        days[2],
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      CachedNetworkImage(imageUrl: dailyIcons[2], width: 40),
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
                            '${dailyChanceofRain[2]} %',
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
                        days[3],
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      CachedNetworkImage(imageUrl: dailyIcons[3], width: 40),
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
                            '${dailyChanceofRain[3]} %',
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
                        days[4],
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      CachedNetworkImage(imageUrl: dailyIcons[4], width: 40),
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
                            '${dailyChanceofRain[4]} %',
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
                enableSideBySideSeriesPlacement: true,
                primaryXAxis: CategoryAxis(
                  isVisible: false,
                ),
                plotAreaBorderWidth: 0,
                primaryYAxis: NumericAxis(
                  labelStyle: TextStyle(
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                  minimum: (lowestTemp - 3),
                  maximum: (highestTemp + 3),
                ),
                series: [
                  SplineSeries<DailyTemp, String>(
                    splineType: SplineType.monotonic,
                    dataSource: dailyHighSeries,
                    color: Colors.red.withOpacity(0.8),
                    xValueMapper: (DailyTemp day, _) => day.day,
                    yValueMapper: (DailyTemp day, _) => day.temp,
                    markerSettings: MarkerSettings(
                      height: 4,
                      width: 4,
                      isVisible: true,
                    ),
                    dataLabelSettings: DataLabelSettings(
                      textStyle: TextStyle(
                        color: useDarkMode ? Colors.white : Colors.black,
                      ),
                      isVisible: true,
                      labelAlignment: ChartDataLabelAlignment.top,
                    ),
                  ),
                  SplineSeries<DailyTemp, String>(
                    splineType: SplineType.monotonic,
                    dataSource: dailyLowSeries,
                    color: Colors.blueAccent,
                    xValueMapper: (DailyTemp day, _) => day.day,
                    yValueMapper: (DailyTemp day, _) => day.temp,
                    markerSettings: MarkerSettings(
                      height: 4,
                      width: 4,
                      isVisible: true,
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

class DailyTemp {
  final String day;
  final int temp;

  DailyTemp({required this.day, required this.temp});
}
