import 'dart:convert';

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '/models/weather_data.dart';
import '/widgets/air_pressure_widget.dart';
import '/widgets/aqi_widget.dart';
import '/widgets/current_conditions_header.dart';
import '/widgets/fancy_appbar.dart';
import '/widgets/fancy_divider.dart';
import '/widgets/hourly_forecast_widget.dart';
import '/widgets/humidity_widget.dart';
import '/widgets/loading_placeholder.dart';
import '/widgets/moon_phase_widget.dart';
import '/widgets/sun_times_widget.dart';
import '/widgets/weekly_forecast_widget.dart';
import '/widgets/wind_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isUpdating = false;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  String locationName = '';
  String regionName = '';
  String currentConditions = '';
  String conditionsIcon = '';
  double currentTempC = 0;
  double realfeelTempC = 0;
  double currentTempF = 0;
  double realfeelTempF = 0;
  double windSpeedKmh = 0;
  double windSpeedMph = 0;
  double windDirectionDegrees = 0;
  String windDirection = '';
  int humidityPercentage = 0;
  double uvIndex = 0;
  String sunrise = '';
  String sunset = '';
  String moonPhase = '';
  int epaAqiIndex = 1;
  double airPressureKpa = 0;
  double airPressureIn = 0;
  bool metricUnits = true;
  String sunriseEpoch = '';
  String sunsetEpoch = '';
  bool useDarkMode = false;
  DateTime lastUpdate = DateTime.now();

  // alert vars
  bool alertInEffect = false;
  String alertHeadline = '';
  String alertType = '';
  String alertUrgency = '';
  String alertAreas = '';
  String alertEvent = '';
  String alertNote = '';
  String alertCertainty = '';
  String alertDescription = '';
  String alertInstructions = '';

  // // hourly vars
  int hourNow = 0;
  int nowPlusThreeHours = 0;
  int nowPlusSixHours = 0;
  int nowPlusNineHours = 0;
  int nowPlusTwelveHours = 0;
  int nowPlusFifteenHours = 0;
  int nowPlusEighteenHours = 0;

  // weekly vars
  double todayHighTempC = 0;
  double todayHighTempF = 0;
  double todayLowTempC = 0;
  double todayLowTempF = 0;
  int todayChanceOfRain = 0;
  String todayConditionsIconUrl = '';
  double nextDayHighTempC = 0;
  double nextDayHighTempF = 0;
  double nextDayLowTempC = 0;
  double nextDayLowTempF = 0;
  int nextDayChanceOfRain = 0;
  String nextDayConditionsIconUrl = '';
  double twoDaysLaterHighTempC = 0;
  double twoDaysLaterHighTempF = 0;
  double twoDaysLaterLowTempC = 0;
  double twoDaysLaterLowTempF = 0;
  int twoDaysLaterChanceOfRain = 0;
  String twoDaysLaterConditionsIconUrl = '';
  double threeDaysLaterHighTempC = 0;
  double threeDaysLaterHighTempF = 0;
  double threeDaysLaterLowTempC = 0;
  double threeDaysLaterLowTempF = 0;
  int threeDaysLaterChanceOfRain = 0;
  String threeDaysLaterConditionsIconUrl = '';
  double fourDaysLaterHighTempC = 0;
  double fourDaysLaterHighTempF = 0;
  double fourDaysLaterLowTempC = 0;
  double fourDaysLaterLowTempF = 0;
  int fourDaysLaterChanceOfRain = 0;
  String fourDaysLaterConditionsIconUrl = '';

  List dailyHighs = [];
  List dailyLows = [];

  // hourly vars
  List forecastHours = [0, 0, 0, 0, 0, 0];
  List hourlyTempC = [0, 0, 0, 0, 0, 0];
  List hourlyTempF = [0, 0, 0, 0, 0, 0];
  List hourlyConditionIcons = [0, 0, 0, 0, 0, 0];
  List hourlyChanceOfRain = [0, 0, 0, 0, 0, 0];

  Future<http.Response> fetchWeatherData(double lat, double long) {
    String apiURL =
        'http://api.weatherapi.com/v1/forecast.json?key=[KEY_HIDDEN]&q=' +
            lat.toString() +
            "," +
            long.toString() +
            '&days=5&aqi=yes&alerts=yes';

    return http.get(Uri.parse(apiURL));
  }

  Future<http.Response> fetchAstroData(double lat, double long) {
    String dateString =
        '${DateTime.now().year}-${DateTime.now().month}-${DateTime.now().day}';

    String apiURL =
        'http://api.weatherapi.com/v1/astronomy.json?key=[KEY_HIDDEN]&q=' +
            lat.toString() +
            "," +
            long.toString() +
            '&dt=' +
            dateString;
    // print('apiURL = $apiURL');

    return http.get(Uri.parse(apiURL));
  }

  Future<Position> _determinePosition() async {
    /// Determine the current position of the device.
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // Continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.medium);
  }

  void populateVars(WeatherData wd) {
    setState(() {
      // populate weatherData from API
      lastUpdate = DateTime.parse(wd.current['last_updated']);
      locationName = wd.location['name'];
      currentConditions = wd.current['condition']['text'];

      currentTempC = wd.current['temp_c'];
      currentTempF = wd.current['temp_f'];
      realfeelTempC = wd.current['feelslike_c'];
      realfeelTempF = wd.current['feelslike_f'];
      windSpeedKmh = wd.current['wind_kph'];
      windSpeedMph = wd.current['wind_mph'];
      windDirectionDegrees = wd.current['wind_degree'].toDouble();
      conditionsIcon = 'https:' + wd.current['condition']['icon'];

      windDirection = wd.current['wind_dir'];
      humidityPercentage = wd.current['humidity'];
      uvIndex = wd.current['uv'];
      sunrise = wd.forecast['forecastday'][0]['astro']['sunrise'];
      sunset = wd.forecast['forecastday'][0]['astro']['sunset'];
      moonPhase = wd.forecast['forecastday'][0]['astro']['moon_phase'];
      // moonPhase = ad.astronomy['astro']['moon_phase'];
      epaAqiIndex = wd.current['air_quality']['us-epa-index'];

      // today is wd.forecast['forecastday'][0]
      todayHighTempC = wd.forecast['forecastday'][0]['day']['maxtemp_c'];
      todayLowTempC = wd.forecast['forecastday'][0]['day']['mintemp_c'];
      todayHighTempF = wd.forecast['forecastday'][0]['day']['maxtemp_f'];
      todayLowTempF = wd.forecast['forecastday'][0]['day']['mintemp_f'];
      todayChanceOfRain =
          wd.forecast['forecastday'][0]['day']['daily_chance_of_rain'];
      todayConditionsIconUrl =
          'http:' + wd.forecast['forecastday'][0]['day']['condition']['icon'];

      // tomorrow's info
      nextDayHighTempC = wd.forecast['forecastday'][1]['day']['maxtemp_c'];
      nextDayLowTempC = wd.forecast['forecastday'][1]['day']['mintemp_c'];
      nextDayHighTempF = wd.forecast['forecastday'][1]['day']['maxtemp_f'];
      nextDayLowTempF = wd.forecast['forecastday'][1]['day']['mintemp_f'];
      nextDayChanceOfRain =
          wd.forecast['forecastday'][1]['day']['daily_chance_of_rain'];
      nextDayConditionsIconUrl =
          'http:' + wd.forecast['forecastday'][1]['day']['condition']['icon'];

      twoDaysLaterHighTempC = wd.forecast['forecastday'][2]['day']['maxtemp_c'];
      twoDaysLaterLowTempC = wd.forecast['forecastday'][2]['day']['mintemp_c'];
      twoDaysLaterHighTempF = wd.forecast['forecastday'][2]['day']['maxtemp_f'];
      twoDaysLaterLowTempF = wd.forecast['forecastday'][2]['day']['mintemp_f'];
      twoDaysLaterChanceOfRain =
          wd.forecast['forecastday'][2]['day']['daily_chance_of_rain'];
      twoDaysLaterConditionsIconUrl =
          'http:' + wd.forecast['forecastday'][2]['day']['condition']['icon'];

      threeDaysLaterHighTempC =
          wd.forecast['forecastday'][3]['day']['maxtemp_c'];
      threeDaysLaterHighTempF =
          wd.forecast['forecastday'][3]['day']['maxtemp_f'];
      threeDaysLaterLowTempC =
          wd.forecast['forecastday'][3]['day']['mintemp_c'];
      threeDaysLaterLowTempF =
          wd.forecast['forecastday'][3]['day']['mintemp_f'];
      threeDaysLaterChanceOfRain =
          wd.forecast['forecastday'][3]['day']['daily_chance_of_rain'];
      threeDaysLaterConditionsIconUrl =
          'http:' + wd.forecast['forecastday'][3]['day']['condition']['icon'];

      fourDaysLaterHighTempC =
          wd.forecast['forecastday'][4]['day']['maxtemp_c'];
      fourDaysLaterHighTempF =
          wd.forecast['forecastday'][4]['day']['maxtemp_f'];
      fourDaysLaterLowTempC = wd.forecast['forecastday'][4]['day']['mintemp_c'];
      fourDaysLaterLowTempF = wd.forecast['forecastday'][4]['day']['mintemp_f'];
      fourDaysLaterChanceOfRain =
          wd.forecast['forecastday'][4]['day']['daily_chance_of_rain'];
      fourDaysLaterConditionsIconUrl =
          'http:' + wd.forecast['forecastday'][4]['day']['condition']['icon'];

      //* Populate hourly forecast vars
      hourNow = DateTime.now().hour;
      hourlyChanceOfRain[0] =
          wd.forecast['forecastday'][0]['hour'][hourNow]['chance_of_rain'];
      hourlyConditionIcons[0] = 'http:' +
          wd.forecast['forecastday'][0]['hour'][hourNow]['condition']['icon'];
      hourlyTempC[0] = wd.forecast['forecastday'][0]['hour'][hourNow]['temp_c'];
      hourlyTempF[0] = wd.forecast['forecastday'][0]['hour'][hourNow]['temp_f'];

      nowPlusThreeHours = hourNow + 3;
      if (nowPlusThreeHours >= 24) {
        nowPlusThreeHours -= 24;
        hourlyChanceOfRain[1] = wd.forecast['forecastday'][1]['hour']
            [nowPlusThreeHours]['chance_of_rain'];
        hourlyConditionIcons[1] = 'http:' +
            wd.forecast['forecastday'][1]['hour'][nowPlusThreeHours]
                ['condition']['icon'];
        hourlyTempC[1] =
            wd.forecast['forecastday'][1]['hour'][nowPlusThreeHours]['temp_c'];
        hourlyTempF[1] =
            wd.forecast['forecastday'][1]['hour'][nowPlusThreeHours]['temp_f'];
        nowPlusThreeHours = wd.forecast['forecastday'][1]['hour']
            [nowPlusThreeHours]['time_epoch'];
      } else {
        hourlyChanceOfRain[1] = wd.forecast['forecastday'][0]['hour']
            [nowPlusThreeHours]['chance_of_rain'];
        hourlyConditionIcons[1] = 'http:' +
            wd.forecast['forecastday'][0]['hour'][nowPlusThreeHours]
                ['condition']['icon'];
        hourlyTempC[1] =
            wd.forecast['forecastday'][0]['hour'][nowPlusThreeHours]['temp_c'];
        hourlyTempF[1] =
            wd.forecast['forecastday'][0]['hour'][nowPlusThreeHours]['temp_f'];
        nowPlusThreeHours = wd.forecast['forecastday'][0]['hour']
            [nowPlusThreeHours]['time_epoch'];
      }

      nowPlusSixHours = hourNow + 6;
      if (nowPlusSixHours >= 24) {
        nowPlusSixHours -= 24;
        hourlyChanceOfRain[2] = wd.forecast['forecastday'][1]['hour']
            [nowPlusSixHours]['chance_of_rain'];
        hourlyConditionIcons[2] = 'http:' +
            wd.forecast['forecastday'][1]['hour'][nowPlusSixHours]['condition']
                ['icon'];
        hourlyTempC[2] =
            wd.forecast['forecastday'][1]['hour'][nowPlusSixHours]['temp_c'];
        hourlyTempF[2] =
            wd.forecast['forecastday'][1]['hour'][nowPlusSixHours]['temp_f'];
        nowPlusSixHours = wd.forecast['forecastday'][1]['hour'][nowPlusSixHours]
            ['time_epoch'];
      } else {
        hourlyChanceOfRain[2] = wd.forecast['forecastday'][0]['hour']
            [nowPlusSixHours]['chance_of_rain'];
        hourlyConditionIcons[2] = 'http:' +
            wd.forecast['forecastday'][0]['hour'][nowPlusSixHours]['condition']
                ['icon'];
        hourlyTempC[2] =
            wd.forecast['forecastday'][0]['hour'][nowPlusSixHours]['temp_c'];
        hourlyTempF[2] =
            wd.forecast['forecastday'][0]['hour'][nowPlusSixHours]['temp_f'];
        nowPlusSixHours = wd.forecast['forecastday'][0]['hour'][nowPlusSixHours]
            ['time_epoch'];
      }

      nowPlusNineHours = hourNow + 9;
      if (nowPlusNineHours >= 24) {
        nowPlusNineHours -= 24;
        hourlyChanceOfRain[3] = wd.forecast['forecastday'][1]['hour']
            [nowPlusNineHours]['chance_of_rain'];
        hourlyConditionIcons[3] = 'http:' +
            wd.forecast['forecastday'][1]['hour'][nowPlusNineHours]['condition']
                ['icon'];
        hourlyTempC[3] =
            wd.forecast['forecastday'][1]['hour'][nowPlusNineHours]['temp_c'];
        hourlyTempF[3] =
            wd.forecast['forecastday'][1]['hour'][nowPlusNineHours]['temp_f'];
        nowPlusNineHours = wd.forecast['forecastday'][1]['hour']
            [nowPlusNineHours]['time_epoch'];
      } else {
        hourlyChanceOfRain[3] = wd.forecast['forecastday'][0]['hour']
            [nowPlusNineHours]['chance_of_rain'];
        hourlyConditionIcons[3] = 'http:' +
            wd.forecast['forecastday'][0]['hour'][nowPlusNineHours]['condition']
                ['icon'];
        hourlyTempC[3] =
            wd.forecast['forecastday'][0]['hour'][nowPlusNineHours]['temp_c'];
        hourlyTempF[3] =
            wd.forecast['forecastday'][0]['hour'][nowPlusNineHours]['temp_f'];
        nowPlusNineHours = wd.forecast['forecastday'][0]['hour']
            [nowPlusNineHours]['time_epoch'];
      }

      nowPlusTwelveHours = hourNow + 12;
      if (nowPlusTwelveHours >= 24) {
        nowPlusTwelveHours -= 24;
        hourlyChanceOfRain[4] = wd.forecast['forecastday'][1]['hour']
            [nowPlusTwelveHours]['chance_of_rain'];
        hourlyConditionIcons[4] = 'http:' +
            wd.forecast['forecastday'][1]['hour'][nowPlusTwelveHours]
                ['condition']['icon'];
        hourlyTempC[4] =
            wd.forecast['forecastday'][1]['hour'][nowPlusTwelveHours]['temp_c'];
        hourlyTempF[4] =
            wd.forecast['forecastday'][1]['hour'][nowPlusTwelveHours]['temp_f'];
        nowPlusTwelveHours = wd.forecast['forecastday'][1]['hour']
            [nowPlusTwelveHours]['time_epoch'];
      } else {
        hourlyChanceOfRain[4] = wd.forecast['forecastday'][0]['hour']
            [nowPlusTwelveHours]['chance_of_rain'];
        hourlyConditionIcons[4] = 'http:' +
            wd.forecast['forecastday'][0]['hour'][nowPlusTwelveHours]
                ['condition']['icon'];
        hourlyTempC[4] =
            wd.forecast['forecastday'][0]['hour'][nowPlusTwelveHours]['temp_c'];
        hourlyTempF[4] =
            wd.forecast['forecastday'][0]['hour'][nowPlusTwelveHours]['temp_f'];
        nowPlusTwelveHours = wd.forecast['forecastday'][0]['hour']
            [nowPlusTwelveHours]['time_epoch'];
      }

      nowPlusFifteenHours = hourNow + 15;
      if (nowPlusFifteenHours >= 24) {
        nowPlusFifteenHours -= 24;
        hourlyChanceOfRain[5] = wd.forecast['forecastday'][1]['hour']
            [nowPlusFifteenHours]['chance_of_rain'];
        hourlyConditionIcons[5] = 'http:' +
            wd.forecast['forecastday'][1]['hour'][nowPlusFifteenHours]
                ['condition']['icon'];
        hourlyTempC[5] = wd.forecast['forecastday'][1]['hour']
            [nowPlusFifteenHours]['temp_c'];
        hourlyTempF[5] = wd.forecast['forecastday'][1]['hour']
            [nowPlusFifteenHours]['temp_f'];
        nowPlusFifteenHours = wd.forecast['forecastday'][1]['hour']
            [nowPlusFifteenHours]['time_epoch'];
      } else {
        hourlyChanceOfRain[5] = wd.forecast['forecastday'][0]['hour']
            [nowPlusFifteenHours]['chance_of_rain'];
        hourlyConditionIcons[5] = 'http:' +
            wd.forecast['forecastday'][0]['hour'][nowPlusFifteenHours]
                ['condition']['icon'];
        hourlyTempC[5] = wd.forecast['forecastday'][0]['hour']
            [nowPlusFifteenHours]['temp_c'];
        hourlyTempF[5] = wd.forecast['forecastday'][0]['hour']
            [nowPlusFifteenHours]['temp_f'];
        nowPlusFifteenHours = wd.forecast['forecastday'][0]['hour']
            [nowPlusFifteenHours]['time_epoch'];
      }

      forecastHours = [
        hourNow = wd.forecast['forecastday'][0]['hour'][hourNow]['time_epoch'],
        nowPlusThreeHours,
        nowPlusSixHours,
        nowPlusNineHours,
        nowPlusTwelveHours,
        nowPlusFifteenHours,
      ];

      airPressureKpa = wd.current['pressure_mb'];
      airPressureIn = wd.current['pressure_in'];
      regionName = wd.location['region'];
      //* Populate Alert vars
      if (wd.alerts['alert'].isEmpty) {
        // no alerts in effect
        alertInEffect = false;
      } else {
        // weather alert(s) ARE in effect
        alertInEffect = true;
        alertAreas = wd.alerts['alert'][0]['areas'];
        alertCertainty = wd.alerts['alert'][0]['certainty'];
        alertDescription = wd.alerts['alert'][0]['desc'];
        alertEvent = wd.alerts['alert'][0]['event'];
        alertHeadline = wd.alerts['alert'][0]['headline'];
        alertInstructions = wd.alerts['alert'][0]['instruction'];
        alertNote = wd.alerts['alert'][0]['note'];
        alertType = wd.alerts['alert'][0]['msgtype'];
        alertUrgency = wd.alerts['alert'][0]['urgency'];
      }
      // sunriseEpoch = wd.forecast['forecastday'][0]['astro']['sunrise'];
      // sunsetEpoch = wd.forecast['forecastday'][0]['astro']['sunset'];
      isUpdating = false;
    });
  }

  Future<List<bool>> findUnits() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    metricUnits = prefs.getBool('isMetric') ?? true;
    useDarkMode = prefs.getBool('useDarkMode') ?? false;
    var results = [metricUnits, useDarkMode];
    return results;
  }

  Future<void> updateWeather() async {
    isUpdating = true;

    //* 1. get location (lat/long)
    Position _userPosition = await _determinePosition();
    // print('${_userPosition.latitude}, ${_userPosition.longitude}');

    //* 2. grab weather data from API
    var _data =
        await fetchWeatherData(_userPosition.latitude, _userPosition.longitude);
    // var _astroData =
    //     await fetchAstroData(_userPosition.latitude, _userPosition.longitude);

    //* 3. parse response
    var parsed = WeatherData.fromJson(jsonDecode(_data.body));
    // var parsedAstro = AstroData.fromJson(jsonDecode(_astroData.body));

    populateVars(parsed);
  }

  fancyDrawer() {
    final double _sh = MediaQuery.of(context).size.height;
    // final bool isDarkMode =
    //     Theme.of(context).textTheme.bodyText1!.color == Colors.white;

    toggleUnits(bool newVal) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      metricUnits
          ? prefs.setBool('isMetric', false)
          : prefs.setBool('isMetric', true);
    }

    toggleDarkMode(bool newVal) async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      useDarkMode
          ? prefs.setBool('useDarkMode', false)
          : prefs.setBool('useDarkMode', true);
    }

    return Drawer(
      child: SafeArea(
        child: Container(
          color: useDarkMode ? Colors.grey[800] : Colors.white,
          height: _sh - kToolbarHeight,
          child: Column(
            children: [
              Container(
                color: useDarkMode
                    ? Color.fromRGBO(150, 200, 200, 1)
                    : Color.fromRGBO(235, 255, 255, 1),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      height: _sh * 0.2,
                      child: Center(
                        child: Image.asset('assets/images/app_icon.png',
                            height: _sh * 0.15),
                      ),
                    ),
                    Text(
                      'Forecast',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 16),
                  ],
                ),
              ),
              Spacer(),
              ListTile(
                trailing: Switch(
                  value: useDarkMode,
                  onChanged: (newVal) {
                    setState(() {
                      toggleDarkMode(newVal);
                    });
                  },
                ),
                title: Text(
                  'Toggle dark mode',
                  style: TextStyle(
                    fontSize: 20,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                trailing: Switch(
                  value: metricUnits,
                  onChanged: (newVal) {
                    setState(() {
                      toggleUnits(newVal);
                    });
                  },
                ),
                title: Text(
                  'Use metric units',
                  style: TextStyle(
                    fontSize: 20,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
              ),
              Divider(),
              ListTile(
                title: Text(
                  'About Forecast',
                  style: TextStyle(
                    fontSize: 20,
                    color: useDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                trailing: Icon(
                  Icons.info,
                  color: useDarkMode ? Colors.white : Colors.black,
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  AwesomeDialog(
                    dialogBackgroundColor:
                        useDarkMode ? Colors.grey[800] : Colors.white,
                    context: context,
                    dialogType: DialogType.NO_HEADER,
                    title: 'Forecast',
                    body: Column(
                      children: [
                        Image.asset(
                          'assets/images/app_icon.png',
                          width: 100,
                        ),
                        Text(
                          'Forecast',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 32,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        SizedBox(height: 32),
                        Text(
                          'Current local weather at your fingertips',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 20,
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: 16),
                        Text(
                          '© 2021 Rob Vandelinder',
                          style: TextStyle(
                            color: useDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                      ],
                    ),
                    btnOkOnPress: () {},
                  )..show();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _refresh() async {
    findUnits();
    setState(() {
      updateWeather();
    });
    _refreshController.refreshCompleted();
  }

  @override
  void initState() {
    super.initState();
    updateWeather();
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat formatter = DateFormat('jm');
    return FutureBuilder(
        future: findUnits(),
        builder: (context, snapshot) {
          return Scaffold(
            drawer: fancyDrawer(),
            appBar: FancyAppBar(
              alert: alertInEffect,
              alertAreas: alertAreas,
              alertDescription: alertDescription,
              alertEvent: alertEvent,
              alertHeadline: alertHeadline,
              alertInstructions: alertInstructions,
              alertNote: alertNote,
              alertType: alertType,
              alertUrgency: alertUrgency,
              useDarkMode: useDarkMode,
            ),
            //     FancyAppBar(
            //   alert: true,
            //   alertAreas: 'Calhoun; Lexington; Richland',
            //   alertDescription:
            //       '...The Flood Warning continues for the following rivers in South\nCarolina...\nCongaree River At Carolina Eastman affecting Richland, Calhoun\nand Lexington Counties.\nCongaree River At Congaree National Park-Gadsden affecting\nCalhoun and Richland Counties.\nNorth Fork Edisto River At Orangeburg affecting Orangeburg County.\n...The Flood Warning is now in effect until Thursday morning...\nThe Flood Warning continues for\nthe Congaree River At Carolina Eastman.\n* Until Thursday morning.\n* At 9:28 PM EST Tuesday the stage was 115.6 feet.\n* Flood stage is 115.0 feet.\n* Minor flooding is occurring and minor flooding is forecast.\n* Recent Activity...The maximum river stage in the 24 hours ending\nat 9:28 PM EST Tuesday was 118.2 feet.\n* Forecast...The river will rise to 115.7 feet just after midnight\ntonight. It will then fall below flood stage tomorrow morning to\n114.2 feet and begin rising again tomorrow evening. It will rise\nto 114.3 feet early Thursday morning. It will then fall again and\nremain below flood stage.\n* Impact...At 115.0 feet, Flooding occurs in low lying areas of the\nCarolina Eastman Facility and at the Congaree National Park.\n* Flood History...This crest compares to a previous crest of 116.3\nfeet on 12/03/2020.\n&&',
            //   alertEvent: 'Flood Warning',
            //   alertHeadline:
            //       'Flood Warning issued January 05 at 9:47PM EST until January 07 at 6:15AM EST by NWS',
            //   alertInstructions:
            //       'A Flood Warning means that flooding is imminent or occurring. All\ninterested parties should take necessary precautions immediately.\nMotorists should not attempt to drive around barricades or drive\ncars through flooded areas.\nCaution is urged when walking near riverbanks.\nAdditional information is available at www.weather.gov.\nThe next statement will be issued Wednesday morning at 1000 AM EST.',
            //   alertNote:
            //       'Alert for Calhoun; Lexington; Richland (South Carolina) Issued by the National Weather Service',
            //   alertType: 'Alert',
            //   alertUrgency: 'Expected',
            //   useDarkMode: useDarkMode,
            // ),
            body: SafeArea(
              child: SmartRefresher(
                controller: _refreshController,
                onRefresh: _refresh,
                enablePullDown: true,
                child: isUpdating
                    ? LoadingPlaceholder(useDarkMode)
                    : Container(
                        color: useDarkMode ? Colors.grey[800] : Colors.white,
                        child: ListView(
                          physics: BouncingScrollPhysics(),
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                CurrentConditionsHeader(
                                  locationName: locationName,
                                  region: regionName,
                                  currentTemp:
                                      metricUnits ? currentTempC : currentTempF,
                                  realfeelTemp: metricUnits
                                      ? realfeelTempC
                                      : realfeelTempF,
                                  units: metricUnits ? '°C' : '°F',
                                  currentConditions: currentConditions,
                                  conditionsIcon: conditionsIcon,
                                  useDarkMode: useDarkMode,
                                ),
                                FancyDivider(useDarkMode),
                                Container(
                                  height: 85,
                                  child: Row(
                                    children: [
                                      HumidityWidget(
                                        humidityPercentage: humidityPercentage,
                                        uvIndex: uvIndex,
                                        useDarkMode: useDarkMode,
                                      ),
                                      VerticalDivider(
                                        color: useDarkMode
                                            ? Colors.white
                                            : Colors.grey[800],
                                      ),
                                      WindWidget(
                                        windSpeed: metricUnits
                                            ? windSpeedKmh
                                            : windSpeedMph,
                                        units: metricUnits ? 'km/h' : 'mph',
                                        windDirectionDegrees:
                                            windDirectionDegrees,
                                        windDirection: windDirection,
                                        useDarkMode: useDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                                FancyDivider(useDarkMode),
                                Container(
                                  height: 85,
                                  child: Row(
                                    children: [
                                      AqiWidget(
                                        aqiIndex: epaAqiIndex,
                                        useDarkMode: useDarkMode,
                                      ),
                                      VerticalDivider(
                                        indent: 0,
                                        color: useDarkMode
                                            ? Colors.white
                                            : Colors.grey[800],
                                      ),
                                      AirPressureWidget(
                                        airPressure: metricUnits
                                            ? airPressureKpa
                                            : airPressureIn,
                                        units: metricUnits ? 'kPa' : 'in',
                                        useDarkMode: useDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                                FancyDivider(useDarkMode),
                                HourlyForecastWidget(
                                  forecastHours: forecastHours,
                                  hourlyTemp:
                                      metricUnits ? hourlyTempC : hourlyTempF,
                                  hourlyConditionIcons: hourlyConditionIcons,
                                  hourlyChanceOfRain: hourlyChanceOfRain,
                                  useDarkMode: useDarkMode,
                                ),
                                FancyDivider(useDarkMode),
                                WeeklyForecastWidget(
                                  useDarkMode: useDarkMode,
                                  day: DateTime.now().weekday,
                                  dailyHighs: metricUnits
                                      ? [
                                          todayHighTempC.toInt(),
                                          nextDayHighTempC.toInt(),
                                          twoDaysLaterHighTempC.toInt(),
                                          threeDaysLaterHighTempC.toInt(),
                                          fourDaysLaterHighTempC.toInt(),
                                        ]
                                      : [
                                          todayHighTempF.toInt(),
                                          nextDayHighTempF.toInt(),
                                          twoDaysLaterHighTempF.toInt(),
                                          threeDaysLaterHighTempF.toInt(),
                                          fourDaysLaterHighTempF.toInt(),
                                        ],
                                  dailyLows: metricUnits
                                      ? [
                                          todayLowTempC.toInt(),
                                          nextDayLowTempC.toInt(),
                                          twoDaysLaterLowTempC.toInt(),
                                          threeDaysLaterLowTempC.toInt(),
                                          fourDaysLaterLowTempC.toInt(),
                                        ]
                                      : [
                                          todayLowTempF.toInt(),
                                          nextDayLowTempF.toInt(),
                                          twoDaysLaterLowTempF.toInt(),
                                          threeDaysLaterLowTempF.toInt(),
                                          fourDaysLaterLowTempF.toInt(),
                                        ],
                                  dailyIcons: [
                                    todayConditionsIconUrl,
                                    nextDayConditionsIconUrl,
                                    twoDaysLaterConditionsIconUrl,
                                    threeDaysLaterConditionsIconUrl,
                                    fourDaysLaterConditionsIconUrl,
                                  ],
                                  dailyChanceofRain: [
                                    todayChanceOfRain,
                                    nextDayChanceOfRain,
                                    twoDaysLaterChanceOfRain,
                                    threeDaysLaterChanceOfRain,
                                    fourDaysLaterChanceOfRain,
                                  ],
                                ),
                                FancyDivider(useDarkMode),
                                Container(
                                  height: 100,
                                  child: Row(
                                    children: [
                                      SunTimesWidget(
                                        sunrise: sunrise,
                                        sunset: sunset,
                                        useDarkMode: useDarkMode,
                                      ),
                                      VerticalDivider(
                                        color: useDarkMode
                                            ? Colors.white
                                            : Colors.grey[800],
                                      ),
                                      MoonPhaseWidget(
                                        moonPhase: moonPhase,
                                        useDarkMode: useDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 16),
                                Text(
                                  'Last updated ${formatter.format(lastUpdate)}',
                                  style: TextStyle(
                                    color: useDarkMode
                                        ? Colors.white
                                        : Colors.black,
                                    fontStyle: FontStyle.italic,
                                  ),
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          );
        });
  }
}
