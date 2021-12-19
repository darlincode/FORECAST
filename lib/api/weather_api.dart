import 'dart:convert';

import 'package:fancy_weather/providers/weather_api_provider.dart';
import 'package:flutter/material.dart';

import 'api_utils.dart';

class WeatherAPI {
  final WeatherAPIProvider _weatherAPIProvider;
  WeatherAPI(this._weatherAPIProvider);

  /// Grab weather data from the API
  Future<APIResponse<dynamic>> getWeatherData({
    @required double lat,
    @required double long,
  }) async {
    var response = await _weatherAPIProvider.getWeatherDataFromApi(lat, long);

    // Return error code is status is not 200 or 201
    if (response.statusCode != 200 || response.statusCode != 201) {
      return APIResponse(
        isOk: false,
        result: null,
        status: response.statusCode,
        message: response.body,
      );
    }

    var _parsedData;

    try {
      var responseBody = json.decode(response.body);
      if (responseBody != null) {
        _parsedData = WeatherData.fromJson(jsonDecode(response.body));
      }
    } catch (exception) {
      return APIResponse(
        isOk: false,
        status: response.statusCode,
        result: null,
        message: exception.toString(),
      );
    }

    return APIResponse(
      isOk: true,
      message: 'OK',
      status: response.statusCode,
      result: _parsedData,
    );
  }
}
