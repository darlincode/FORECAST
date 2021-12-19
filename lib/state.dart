import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/models/weather_alert_model.dart';
import 'package:flutter/material.dart';

@immutable
class GlobalAppState {
  final Location currentLocInfo;
  final List<WeatherAlert> activeWeatherAlerts;
  final SettingsStateRepository userSettings;
  final List<Location> locations;
  final LoadingStatus loadingStatus;
  final ConnectionStatus connectionStatus;
  final WeatherStateRepository weatherData;

  const GlobalAppState({
    this.locations,
    this.currentLocInfo,
    this.activeWeatherAlerts,
    this.loadingStatus,
    this.connectionStatus,
    this.userSettings,
    this.weatherData,
  });

  GlobalAppState.initialState()
      : weatherData = WeatherStateRepository.createEmpty(),
        currentLocInfo = Location.createEmpty(),
        activeWeatherAlerts = List.unmodifiable([]),
        userSettings = SettingsStateRepository.createEmpty(),
        locations = List.unmodifiable([]),
        connectionStatus = ConnectionStatus.Online,
        loadingStatus = LoadingStatus.Idle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalAppState &&
          other.weatherData == weatherData &&
          other.currentLocInfo == currentLocInfo &&
          other.activeWeatherAlerts == activeWeatherAlerts &&
          other.userSettings == userSettings &&
          other.locations == locations &&
          other.connectionStatus == connectionStatus &&
          other.loadingStatus == loadingStatus;

  @override
  int get hashCode =>
      weatherData.hashCode ^
      currentLocInfo.hashCode ^
      activeWeatherAlerts.hashCode ^
      userSettings.hashCode ^
      locations.hashCode ^
      connectionStatus.hashCode ^
      loadingStatus.hashCode;

  GlobalAppState copyWith(
    WeatherStateRepository weatherData,
    Location currentLocInfo,
    List<WeatherAlert> activeWeatherAlerts,
    SettingsStateRepository userSettings,
    List<Location> locations,
    LoadingStatus connectionStatus,
    LoadingStatus loadingStatus,
  ) =>
      GlobalAppState(
        weatherData: weatherData ?? this.weatherData,
        currentLocInfo: currentLocInfo ?? this.currentLocInfo,
        activeWeatherAlerts: activeWeatherAlerts ?? this.activeWeatherAlerts,
        userSettings: userSettings ?? this.userSettings,
        locations: locations ?? this.locations,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        loadingStatus: loadingStatus ?? this.loadingStatus,
      );

  GlobalAppState.fromJson(Map<String, dynamic> json)
      : userSettings = json['userSettings'],
        connectionStatus = json['connectionStatus'],
        loadingStatus = json['loadingStatus'],
        currentLocInfo = json['currentLocInfo'],
        weatherData = json['weatherData'],
        activeWeatherAlerts = (json['activeWeatherAlerts'] as List)
            .map((i) => WeatherAlert.fromJson(i))
            .toList(),
        locations = (json['locations'] as List)
            .map((i) => Location.fromJson(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'userSettings': userSettings,
        'weatherData': weatherData,
        'currentLocInfo': currentLocInfo,
        'activeWeatherAlerts': activeWeatherAlerts,
        'locations': locations,
      };
}
