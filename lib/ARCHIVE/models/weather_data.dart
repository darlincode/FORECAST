import 'package:flutter/material.dart';

class WeatherData extends ChangeNotifier {
  final Map<String, dynamic> location;
  final Map<String, dynamic> current;
  final Map<String, dynamic> forecast;
  final Map<String, dynamic> alerts;

  WeatherData(
    this.location,
    this.current,
    this.forecast,
    this.alerts,
  );

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    return WeatherData(
      json['location'],
      json['current'],
      json['forecast'],
      json['alerts'],
    );
  }
}
