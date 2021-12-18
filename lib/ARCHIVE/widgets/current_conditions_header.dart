import 'package:flutter/material.dart';

class CurrentConditionsHeader extends StatelessWidget {
  final String locationName, conditionsIcon, region;
  final currentTemp;
  final currentConditions;
  final realfeelTemp;
  final units;
  final bool useDarkMode;

  CurrentConditionsHeader({
    required this.locationName,
    required this.currentTemp,
    required this.realfeelTemp,
    required this.units,
    required this.currentConditions,
    required this.conditionsIcon,
    required this.region,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: useDarkMode ? Colors.grey[800] : Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '$locationName',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
            Text(
              '$region',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w300,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Container(
              child: Text(
                '${currentTemp.toInt()}$units',
                style: TextStyle(
                  fontSize: 128,
                  fontWeight: FontWeight.w200,
                  fontFamily: 'sans',
                  letterSpacing: -1,
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ),
            Transform.scale(
              scale: 1,
              child: Image.network(
                conditionsIcon,
              ),
            ),
            Text(
              currentConditions,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Feels like ${realfeelTemp.toInt()}$units',
              style: TextStyle(
                fontSize: 16,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
