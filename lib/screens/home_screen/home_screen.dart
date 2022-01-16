import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/actions/actions.dart';
// import 'package:fancy_weather/routes.dart';
import 'package:fancy_weather/screens/home_screen/home_screen_view_model.dart';
// import 'package:fancy_weather/screens/screens.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/fancy_end_drawer.dart';
import 'package:fancy_weather/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_weather_bg/bg/weather_bg.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:redux/redux.dart';

@immutable
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onInit(Store<GlobalAppState> store) {
    // try {
    /// Try to load user settings and list of locations from local storage
    store.dispatch(LoadLocalDataAction());
  }

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;
    final double _sh = MediaQuery.of(context).size.height;

    return StoreConnector<GlobalAppState, HomeScreenViewModel>(
      distinct: true,
      converter: (Store<GlobalAppState> store) =>
          HomeScreenViewModel.create(store),
      onInit: _onInit,
      builder: (BuildContext context, HomeScreenViewModel viewModel) {
        return Scaffold(
          key: _scaffoldKey,
          backgroundColor: viewModel == null
              ? Theme.of(context).brightness == Brightness.dark
                  ? bgColorDarkMode
                  : bgColorLightMode
              : viewModel.useDarkMode
                  ? bgColorDarkMode
                  : bgColorLightMode,
          endDrawer: FancyEndDrawer(),
          body: viewModel != null
              ? viewModel.isLoading
                  ? SplashScreen()
                  : Stack(
                      children: [
                        if (viewModel.useAnimatedBackgrounds)
                          WeatherBg(
                            width: _sw,
                            height: _sh,
                            weatherType:
                                viewModel.weatherType(viewModel.conditionsCode),
                          ),
                        SafeArea(
                          child: Stack(
                            children: [
                              SingleChildScrollView(
                                child: Container(
                                  width: _sw,
                                  height: _sh,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 48),
                                      TemperaturePanel(),
                                      // HourlyForecastPanel(),
                                      // DailyForecastPanel(),
                                      // ConditionsPanel(),
                                      // WindConditionsPanel(),
                                      // AirQualityPanel(),
                                      // AstroDataPanel(),
                                    ],
                                  ),
                                ),
                              ),
                              // IconButton(
                              //   icon: Icon(Icons.settings_outlined),
                              //   onPressed: () {
                              //     Navigator.of(context).push(
                              //       MaterialPageRoute(
                              //           builder: (ctx) => SettingsScreen()),
                              //     );
                              //   },
                              // ),
                            ],
                          ),
                        ),
                      ],
                    )
              : SplashScreen(),
          // ),
        );
      },
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 96,
            width: 96,
            child: Image.asset('assets/images/logo/app_icon.png'),
          ),
          SizedBox(height: 32),
          Text(tr('loading')),
          SizedBox(
            height: 32,
            width: 32,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
