import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class APIForecast extends Entity<APIForecast> {
  List<APIForecastDay> forecastday;

  APIForecast({this.forecastday});

  @override
  factory APIForecast.createEmpty() => APIForecast(
        forecastday: List.unmodifiable([]),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APIForecast && other.forecastday == forecastday;

  @override
  int get hashCode => forecastday.hashCode;

  @override
  APIForecast copyWith({
    forecastday,
  }) =>
      APIForecast(
        forecastday: forecastday ?? this.forecastday,
      );

  @override
  Map<String, dynamic> toJson() => {
        'forecastday': forecastday,
      };

  @override
  APIForecast.fromJson(json) : forecastday = List.from(json['forecast']);

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid => forecastday != null;
}
