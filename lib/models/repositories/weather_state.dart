import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// Weather data repository
/// Holds state for current conditions, daily and hourly forecast,
/// astrological data, and weather alerts
@immutable
class WeatherStateRepository extends Entity<WeatherStateRepository> {
  final APILocation location;
  final APICurrentConditions currentConditions;
  final APIForecast forecast;
  final List<APIAlert> weatherAlerts;

  WeatherStateRepository({
    @required this.location,
    @required this.currentConditions,
    @required this.forecast,
    @required this.weatherAlerts,
  });

  @override
  factory WeatherStateRepository.createEmpty() => WeatherStateRepository(
      location: APILocation.createEmpty(),
      currentConditions: APICurrentConditions.createEmpty(),
      forecast: APIForecast.createEmpty(),
      weatherAlerts: []);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherStateRepository &&
          other.location == location &&
          other.currentConditions == currentConditions &&
          other.forecast == forecast &&
          other.weatherAlerts == weatherAlerts;

  @override
  int get hashCode =>
      location.hashCode ^
      currentConditions.hashCode ^
      forecast.hashCode ^
      weatherAlerts.hashCode;

  @override
  WeatherStateRepository copyWith(
          {APILocation location,
          APICurrentConditions currentConditions,
          APIForecast forecast,
          List<APIAlert> weatherAlerts}) =>
      WeatherStateRepository(
          location: location ?? this.location,
          currentConditions: currentConditions ?? this.currentConditions,
          forecast: forecast ?? this.forecast,
          weatherAlerts: weatherAlerts ?? this.weatherAlerts);

  @override
  Map<String, dynamic> toJson() => {
        'location': location ?? null,
        'currentConditions': currentConditions ?? null,
        'forecast': forecast ?? null,
        'weatherAlerts': weatherAlerts ?? null
      };

  @override
  WeatherStateRepository.fromJson(Map<String, dynamic> json)
      : location = APILocation.fromJson(json['location']),
        currentConditions = APICurrentConditions.fromJson(json['current']),
        forecast = APIForecast.fromJson(json['forecast']),
        weatherAlerts = (json['alerts']['alert'] as List)
            .map((i) => APIAlert.fromJson(i))
            .toList();

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      location != null &&
      currentConditions != null &&
      forecast != null &&
      weatherAlerts != null;
}
