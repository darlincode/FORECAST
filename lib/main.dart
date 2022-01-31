import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/init.dart';
import 'package:fancy_weather/middleware/middleware.dart';
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
  await EasyLocalization.ensureInitialized();

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

  runApp(EasyLocalization(
      supportedLocales: [
        const Locale('en'),
        const Locale('fr'),
        const Locale('es'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: ForecastApp(globalStore)));
}

@immutable
class ForecastApp extends StatelessWidget {
  final Store<GlobalAppState> store;
  ForecastApp(this.store);
  @override
  Widget build(BuildContext context) {
    return StoreProvider(
      key: Key('global-store'),
      store: store,
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        title: 'Forecast',
        theme: ThemeData(
          primarySwatch: Colors.green,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Lato',
        ),
        home: HomeScreen(),
        // StoreBuilder<GlobalAppState>(
        //   // onInit: onInit,
        //   builder: (BuildContext context, Store<GlobalAppState> store) =>
        //       HomeScreen(),
        // ),
      ),
    );
  }
}
