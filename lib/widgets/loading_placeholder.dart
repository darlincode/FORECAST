import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPlaceholder extends StatelessWidget {
  final bool useDarkMode;
  LoadingPlaceholder(this.useDarkMode);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: useDarkMode ? Colors.grey[800] : Colors.white,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Grabbing weather data ...',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: useDarkMode ? Colors.white : Colors.black,
              ),
            ),
            SizedBox(height: 32),
            SpinKitCircle(
              color: Colors.green,
              size: 60.0,
            )
          ],
        ),
      ),
    );
  }
}
