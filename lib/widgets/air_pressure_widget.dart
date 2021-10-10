import 'package:flutter/material.dart';

class AirPressureWidget extends StatelessWidget {
  final airPressure;
  final units;
  final bool useDarkMode;

  AirPressureWidget({
    required this.airPressure,
    required this.units,
    required this.useDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return Container(
      width: (_sw / 2) - 8,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'AIR PRESSURE',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  units == 'kPa'
                      ? '${(airPressure * 0.1).toStringAsFixed(1)} $units'
                      : '${airPressure.toStringAsFixed(2)} $units',
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
