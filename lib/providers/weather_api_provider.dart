import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:fancy_weather/config/config.dart' as config;


@immutable
class WeatherAPIProvider {
  final String _apiUrl = 'v1/forecast.json?key=${config.getAPIKey()}&q=';
  WeatherAPIProvider();

  Future<http.Response> getWeatherDataFromApi(double lat, double long) {
    return http.get(config
        .getAPIUrl()
        .resolve('$_apiUrl$lat,$long&days=5&aqi=yes&alerts=yes'));
  }
}
