import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class FetchWeatherDataAction {
  final Location location;
  FetchWeatherDataAction(this.location);
}

@immutable
class SetWeatherStateAction {
  final WeatherStateRepository weatherStateRepository;
  SetWeatherStateAction(this.weatherStateRepository);
}
