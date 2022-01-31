import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/screens/home_screen/home_screen_view_model.dart';
import 'package:fancy_weather/screens/screens.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/fancy_drawer.dart';
import 'package:fancy_weather/widgets/cards/cards.dart';
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
    store.dispatch(LoadLocalDataAction());
  }

  Widget _buildRefreshButton(HomeScreenViewModel viewModel) {
    return IconButton(
      icon: Icon(Icons.refresh, color: grey.withOpacity(0.8), size: 32),
      onPressed: () {
        viewModel.refreshScreen();
      },
    );
  }

  Widget _buildSettingsButton(HomeScreenViewModel viewModel) {
    return IconButton(
      icon: Icon(Icons.menu, color: grey.withOpacity(0.8), size: 32),
      onPressed: () {
        _scaffoldKey.currentState.openDrawer();
      },
    );
  }

  /// Weather "alert" chip that will show a bottomSheet with details
  /// about the weather alert
  Widget _buildWeatherAlertChip(HomeScreenViewModel viewModel) {
    double _opacity = 0.8;
    return GestureDetector(
      onTap: () {},
      child: Chip(
        autofocus: false,
        label: Text(tr('alert')),
        padding: EdgeInsets.fromLTRB(8, 0, 4, 2),
        backgroundColor: red.withOpacity(_opacity),
        labelStyle: TextStyle(
          color: white,
          fontWeight: FontWeight.bold,
        ),
        avatar: Icon(Icons.warning_amber_rounded, color: white),
      ),
    );
  }

  /// Retrieves the proper bgColor based on device theme
  Color _getBgColor(viewModel) {
    return viewModel == null
        ? Theme.of(context).brightness == Brightness.dark
            ? bgColorDarkMode
            : bgColorLightMode
        : viewModel.useDarkMode
            ? bgColorDarkMode
            : bgColorLightMode;
  }

  /// Build body panels
  List<Widget> _buildWeatherDetails(viewModel) {
    return [
      const SizedBox(height: 48),
      const TemperatureCard(),
      viewModel.useAnimatedBackgrounds
          ? const SizedBox(height: 8)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),
                Divider(color: grey, indent: 32, endIndent: 32),
                const SizedBox(height: 4),
              ],
            ),
      const HumidityUVCard(),
      viewModel.useAnimatedBackgrounds
          ? const SizedBox(height: 8)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),
                Divider(color: grey, indent: 32, endIndent: 32),
                const SizedBox(height: 4),
              ],
            ),
      const WindConditionsCard(),
      viewModel.useAnimatedBackgrounds
          ? const SizedBox(height: 8)
          : Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 4),
                Divider(color: grey, indent: 32, endIndent: 32),
                const SizedBox(height: 4),
              ],
            ),

      // Row(children: [
      //   AQICard(),
      //   AirPressureCard(),
      // ]),
      // HourlyForecastPanel(),
      // DailyForecastPanel(),
      // ConditionsPanel(),
      // WindConditionsPanel(),
      // AirQualityPanel(),
      // AstroDataPanel(),
    ];
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
          backgroundColor: _getBgColor(viewModel),
          drawer: FancyDrawer(),
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
                                    children: _buildWeatherDetails(viewModel),
                                  ),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  _buildSettingsButton(viewModel),
                                  if (viewModel.isActiveWeatherAlerts)
                                    _buildWeatherAlertChip(viewModel),
                                  _buildRefreshButton(viewModel),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
              : SplashScreen(),
        );
      },
    );
  }
}
