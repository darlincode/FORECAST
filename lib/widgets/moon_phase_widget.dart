import 'package:flutter/material.dart';

class MoonPhaseWidget extends StatelessWidget {
  final String moonPhase;
  final bool useDarkMode;

  // TextStyle(
  //   color: useDarkMode ? Colors.white : Colors.black,
  // )
  MoonPhaseWidget({required this.moonPhase, required this.useDarkMode});

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    Widget moonPhasePlaceholder = Container();

    Widget newMoon() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 30,
            height: 30,
            color: useDarkMode ? Colors.grey[800] : Colors.grey[600],
          ),
        ),
      );
    }

    Widget fullMoon() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: 30,
            height: 30,
            color: Colors.white,
          ),
        ),
      );
    }

    Widget waxingGibbous() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 30,
                  height: 30,
                  color: useDarkMode ? Colors.grey[800] : Colors.grey[600],
                ),
              ),
              Positioned(
                left: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget waningGibbous() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 30,
                  height: 30,
                  color: useDarkMode ? Colors.grey[800] : Colors.grey[600],
                ),
              ),
              Positioned(
                right: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 30,
                    height: 30,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget firstQuarter() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 30,
                  height: 30,
                  color: useDarkMode ? Colors.grey[800] : Colors.grey[600],
                ),
              ),
              Positioned(
                left: 15,
                child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget thirdQuarter() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 30,
                  height: 30,
                  color: useDarkMode ? Colors.grey[800] : Colors.grey[600],
                ),
              ),
              Positioned(
                right: 15,
                child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget waxingCrescent() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ),
              Positioned(
                height: 30,
                width: 30,
                right: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 30,
                    height: 30,
                    color: useDarkMode ? Colors.grey[800] : Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    Widget waningCrescent() {
      return Container(
        decoration: BoxDecoration(
          border: Border.all(width: 1),
          shape: BoxShape.circle,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Container(
                  width: 30,
                  height: 30,
                  color: Colors.white,
                ),
              ),
              Positioned(
                height: 30,
                width: 30,
                left: 7,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Container(
                    width: 30,
                    height: 30,
                    color: useDarkMode ? Colors.grey[800] : Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }

    switch (moonPhase) {
      case 'New Moon':
        moonPhasePlaceholder = newMoon();
        break;
      case 'Waxing Crescent':
        moonPhasePlaceholder = waxingCrescent();
        break;
      case 'First Quarter':
        moonPhasePlaceholder = firstQuarter();
        break;
      case 'Waxing Gibbous':
        moonPhasePlaceholder = waxingGibbous();
        break;
      case 'Full Moon':
        moonPhasePlaceholder = fullMoon();
        break;
      case 'Waning Gibbous':
        moonPhasePlaceholder = waningGibbous();
        break;
      case 'Last Quarter':
        moonPhasePlaceholder = thirdQuarter();
        break;
      case 'Waning Crescent':
        moonPhasePlaceholder = waningCrescent();
        break;
    }
    return Container(
      width: (_sw / 2) - 8,
      // height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'MOON PHASE',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 4),
              Text(
                '$moonPhase',
                style: TextStyle(
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
              ),
              SizedBox(height: 16),
              moonPhasePlaceholder,
            ],
          )
        ],
      ),
    );
  }
}
