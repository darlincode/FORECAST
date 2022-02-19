import 'keys.dart';

Uri _weatherApiUrl = Uri.parse('http://api.weatherapi.com');

// Uri _openWeatherMapUrl = Uri.parse('');

class Config {
  Uri _apiUrl = _weatherApiUrl;
  String _apiKey = Keys.weatherApiKey;
  String _gApiKey = Keys.googleApiKey;

  Uri get apiUrl => _apiUrl;
  String get apiKey => _apiKey;
  String get gApiKey => _gApiKey;

  static Config _configState;

  Config._internal();

  factory Config() {
    if (_configState == null) {
      Config._configState = new Config._internal();
    }
    return Config._configState;
  }
}

Uri getAPIUrl() {
  return Config().apiUrl;
}

String getAPIKey() {
  return Config().apiKey;
}

String getGoogleKey() {
  return Config().gApiKey;
}
