import 'package:connectivity/connectivity.dart';
import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/init.dart';
import 'package:fancy_weather/middleware/middleware.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/providers/providers.dart';
import 'package:fancy_weather/reducers/reducers.dart';
import 'package:fancy_weather/screens/screens.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jailbreak_detection/flutter_jailbreak_detection.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

Store<GlobalAppState> globalStore;

Future<bool> isRooted() async {
  bool isRooted = await FlutterJailbreakDetection.jailbroken;
  // bool developerMode = await FlutterJailbreakDetection.developerMode;
  bool isDebugging = !kReleaseMode;

  if (isDebugging) {
    print('Device is rooted?  $isRooted');
    if (isRooted) print('Ignoring root: developer mode detected');
    return false;
  }

  return isRooted;
}

final WeatherAPIProvider weatherApiProvider = WeatherAPIProvider();
final WeatherAPI weatherApi = WeatherAPI(weatherApiProvider);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // == UNCOMMENT THIS TO ENABLE ROOT DETECTION ==
  // if (await isRooted()) {
  //   print('Device is rooted, prevent app start');
  //   // runApp(RootWarningDialog());
  //   return;
  // }
  // =========================================================

  ForecastProviders forecastProviders = ForecastProviders();
  forecastProviders.initialize();
  ForecastAPIs forecastApis = ForecastAPIs();
  forecastApis.initialize(forecastProviders);

  final List<
          void Function(Store<GlobalAppState>, dynamic, void Function(dynamic))>
      globalAppStateMiddleware = buildGlobalAppStateMiddleware(
    weatherApi: forecastApis.weatherApi,
  );

  globalStore = Store<GlobalAppState>(
    globalAppStateReducer,
    initialState: GlobalAppState.initialState(),
    middleware: globalAppStateMiddleware,
  );

  runApp(ForecastApp(globalStore));
}

@immutable
class ForecastApp extends StatelessWidget {
  final Store<GlobalAppState> store;
  ForecastApp(this.store);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        fontFamily: 'Montserrat',
      ),
      darkTheme: ThemeData.dark(),
      home: StoreBuilder<GlobalAppState>(
        onInit: (Store<GlobalAppState> store) {
          store.dispatch(SetLoadingStatusAction(LoadingStatus.Loading));

          print('main.onInit fired');
          Connectivity().checkConnectivity().then(
            (ConnectivityResult _initialConnectivity) {
              store.dispatch(ConnectivityChangedAction(_initialConnectivity));
              if (_initialConnectivity != ConnectivityResult.none)
                store.dispatch(
                    SetConnectionStatusAction(ConnectionStatus.Online));
            },
          );
        },
        builder: (BuildContext context, Store<GlobalAppState> store) =>
            HomeScreen(),
      ),
    );
  }
}
