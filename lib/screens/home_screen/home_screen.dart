import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/screens/home_screen/home_screen_view_model.dart';
import 'package:fancy_weather/screens/screens.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/fancy_drawer/fancy_drawer.dart';
import 'package:fancy_weather/widgets/cards/cards.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_weather_bg/bg/weather_bg.dart';
import 'package:flutter_weather_bg/flutter_weather_bg.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:redux/redux.dart';

@immutable
class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

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
  List<Widget> _buildWeatherDetails(HomeScreenViewModel viewModel) {
    return [
      const SizedBox(height: 48),
      const TemperatureCard(),
      _fancyDivider(viewModel),
      const HumidityUVCard(),
      _fancyDivider(viewModel),
      const WindConditionsCard(),
      _fancyDivider(viewModel),
      if (viewModel.activeIndex == 0) AstroDataCard(),
      if (viewModel.activeIndex == 0) _fancyDivider(viewModel),
      const AQIAirPressureCard(),
      _fancyDivider(viewModel),
      // HourlyForecastPanel(),
      // DailyForecastPanel(),
    ];
  }

  Widget _fancyDivider(HomeScreenViewModel viewModel) {
    return viewModel.useAnimatedBackgrounds
        ? const SizedBox(height: 8)
        : Column(mainAxisSize: MainAxisSize.min, children: [
            const SizedBox(height: 4),
            Divider(color: grey, indent: 32, endIndent: 32),
            const SizedBox(height: 4)
          ]);
  }

  Widget _buildBodyContent(HomeScreenViewModel viewModel) {
    final double _sw = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Stack(children: [
      SmartRefresher(
        onRefresh: () {
          viewModel.dispatch(LoadLocalDataAction());
          _refreshController.refreshCompleted();
        },
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: false,
        header: MaterialClassicHeader(
          backgroundColor: viewModel.panelColor,
        ),
        child: SingleChildScrollView(
            child: Container(
                width: _sw,
                child: Column(children: _buildWeatherDetails(viewModel)))),
      ),
      Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        _buildSettingsButton(viewModel),
        if (viewModel.isActiveWeatherAlerts) _buildWeatherAlertChip(viewModel),
        _buildRefreshButton(viewModel),
      ])
    ]));
  }

  Widget _buildWeatherBackground(HomeScreenViewModel viewModel) {
    final double _sw = MediaQuery.of(context).size.width;
    final double _sh = MediaQuery.of(context).size.height;
    return WeatherBg(
        width: _sw,
        height: _sh,
        weatherType: viewModel.weatherType(viewModel.conditionsCode));
  }

  Widget _buildLoadingOverlay(HomeScreenViewModel viewModel) {
    final double _sw = MediaQuery.of(context).size.width;
    final double _sh = MediaQuery.of(context).size.height;

    return Stack(
      children: [
        Container(
          height: _sh,
          width: _sw,
          color: viewModel.panelColor.withOpacity(0.6),
        ),
        Center(
          child: Container(
            height: 150,
            width: 250,
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: viewModel.panelColor,
                border: Border.all(color: green, width: 2)),
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  // const SizedBox(height: 8),
                  CircularProgressIndicator(),
                  const SizedBox(height: 8),
                  Text(
                    'Fetching latest weather data...',
                    textAlign: TextAlign.center,
                    style: viewModel.fetchingDataStyle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
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
              body: viewModel == null
                  ? SplashScreen()
                  : Stack(children: [
                      if (viewModel.useAnimatedBackgrounds)
                        _buildWeatherBackground(viewModel),
                      _buildBodyContent(viewModel),
                      if (viewModel.isLoading) _buildLoadingOverlay(viewModel)
                    ]));
        });
  }
}
