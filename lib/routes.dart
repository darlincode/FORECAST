import 'package:fancy_weather/screens/screens.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class Routes {
  static const home_screen = '/home';
  static const settings_screen = '/settings';
  static const locations_screen = '/locations';

  static MaterialPageRoute buildRoute(RouteSettings settings, Widget builder) {
    return MaterialPageRoute(
      settings: settings,
      builder: (BuildContext context) => builder,
    );
  }

  static Map<String, dynamic> buildRoutes(Store<GlobalAppState> store) {
    return {
      Routes.home_screen: (BuildContext context) => HomeScreen(),
      // Routes.settings_screen: (BuildContext context) => SettingsScreen(),
      // Routes.locations_screen: (BuildContext context) => LocationsScreen(),
    };
  }
}
