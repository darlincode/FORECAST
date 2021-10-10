import 'package:flutter/material.dart';

class HumidityWidget extends StatelessWidget {
  final humidityPercentage;
  final uvIndex;
  final bool useDarkMode;
  HumidityWidget({
    required this.humidityPercentage,
    required this.uvIndex,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return Container(
      color: useDarkMode ? Colors.grey[800] : Colors.white,
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
                  'HUMIDITY',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '$humidityPercentage%',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'UV INDEX',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  '${uvIndex.toInt()}',
                  style: TextStyle(
                    fontSize: 20,
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
