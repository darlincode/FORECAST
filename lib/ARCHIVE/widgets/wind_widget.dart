import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WindWidget extends StatelessWidget {
  final double windSpeed;
  final double windDirectionDegrees;
  final String windDirection;
  final String units;
  final bool useDarkMode;

  WindWidget({
    required this.windSpeed,
    required this.windDirectionDegrees,
    required this.windDirection,
    required this.units,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return Container(
      color: useDarkMode ? Colors.grey[800] : Colors.white,
      width: (_sw / 2) - 8,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.only(right: 32),
            child: Text(
              'WIND',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
          ),
          SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '$windSpeed',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                      color: useDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    '$units',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                      color: useDarkMode ? Colors.white : Colors.black,
                    ),
                  ),
                ],
              ),
              Container(
                width: _sw / 4,
                height: 60,
                child: Stack(
                  children: [
                    SfRadialGauge(
                      axes: [
                        RadialAxis(
                          axisLineStyle: AxisLineStyle(
                            thickness: 3,
                          ),
                          minimum: 0,
                          maximum: 360,
                          pointers: [
                            MarkerPointer(
                              elevation: 4,
                              markerType: MarkerType.triangle,
                              value: windDirectionDegrees,
                            ),
                          ],
                          showTicks: false,
                          startAngle: 270,
                          endAngle: 270,
                          showLabels: false,
                        ),
                      ],
                    ),
                    Center(
                      child: Text(
                        '$windDirection',
                        style: TextStyle(
                          color: useDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
