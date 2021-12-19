import 'package:fancy_weather/api/api_utils.dart';
import 'package:flutter/material.dart';

class FetchWeatherDataAction {
  final double lat;
  final double long;
  FetchWeatherDataAction({@required this.lat, @required this.long});
}

class SetWeatherDataAction {
  final APIResponse response;
  SetWeatherDataAction(this.response);
}
