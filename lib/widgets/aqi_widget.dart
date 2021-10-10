import 'package:flutter/material.dart';

class AqiWidget extends StatelessWidget {
  final aqiIndex;
  final bool useDarkMode;
  AqiWidget({
    required this.aqiIndex,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;
    String airQualityText = '';

    switch (aqiIndex) {
      case 1:
        airQualityText = 'Good';
        break;
      case 2:
        airQualityText = 'Moderate';
        break;
      case 3:
        airQualityText = 'Unhealthy for sensitive people';
        break;
      case 4:
        airQualityText = 'Unhealthy';
        break;
      case 5:
        airQualityText = 'Very unhealthy';
        break;
      case 6:
        airQualityText = 'Hazardous';
        break;
    }

    return Container(
      width: (_sw / 2) - 8,
      // height: 100,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'AIR QUALITY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '$aqiIndex',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '($airQualityText)',
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
