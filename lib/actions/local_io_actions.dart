import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class SavePrefsAction {
  final SettingsStateRepository userSettings;
  final WeatherStateRepository weatherData;
  SavePrefsAction(this.userSettings, this.weatherData);
}

@immutable
class LoadPrefsAction {
  LoadPrefsAction();
}
