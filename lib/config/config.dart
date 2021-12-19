const String _weatherApiKey = '8555ce64325240e9a71211345211206';
Uri _weatherApiUrl = Uri.parse('http://api.weatherapi.com');
// const String _openWeatherMapKey = '';
// Uri _openWeatherMapUrl = Uri.parse('');

class Config {
// TODO: Change these to switch weather data providers
  Uri _apiUrl = _weatherApiUrl;
  String _apiKey = _weatherApiKey;

  Uri get apiUrl => _apiUrl;
  String get apiKey => _apiKey;

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
