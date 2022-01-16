import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/providers/providers.dart';

class ForecastProviders {
  void initialize() {
    weatherAPIProvider = WeatherAPIProvider();
  }

  WeatherAPIProvider weatherAPIProvider;
}

class ForecastAPIs {
  void initialize(ForecastProviders providers) {
    weatherApi = WeatherAPI(providers.weatherAPIProvider);
  }

  WeatherAPI weatherApi;
}
