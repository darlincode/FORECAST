import 'package:flutter/material.dart';

class SunTimesWidget extends StatelessWidget {
  final String sunrise, sunset;
  final bool useDarkMode;

  // TextStyle(
  // color: useDarkMode ? Colors.white : Colors.black,
  // )
  SunTimesWidget({
    required this.sunrise,
    required this.sunset,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return Container(
      width: (_sw / 2) - 8,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'SUNRISE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '$sunrise',
                style: TextStyle(
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16),
              Text(
                'SUNSET',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '$sunset',
                style: TextStyle(
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
