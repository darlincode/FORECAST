import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class GlobalAppState {
  final int activeLocation;
  final Location currentLocInfo;
  final SettingsStateRepository userSettings;
  final List<Location> locations;
  final LoadingStatus loadingStatus;
  final ConnectionStatus connectionStatus;
  final WeatherStateRepository weatherData;

  const GlobalAppState({
    this.locations,
    this.activeLocation,
    this.currentLocInfo,
    this.loadingStatus,
    this.connectionStatus,
    this.userSettings,
    this.weatherData,
  });

  GlobalAppState.initialState()
      : weatherData = WeatherStateRepository.createEmpty(),
       activeLocation = 0,
        currentLocInfo = Location.createEmpty(),
        userSettings = SettingsStateRepository.createEmpty(),
        locations = List.unmodifiable([]),
        connectionStatus = ConnectionStatus.Online,
        loadingStatus = LoadingStatus.Idle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalAppState &&
          other.activeLocation == activeLocation &&
          other.weatherData == weatherData &&
          other.currentLocInfo == currentLocInfo &&
          other.userSettings == userSettings &&
          other.locations == locations &&
          other.connectionStatus == connectionStatus &&
          other.loadingStatus == loadingStatus;

  @override
  int get hashCode =>
      activeLocation.hashCode ^
      weatherData.hashCode ^
      currentLocInfo.hashCode ^
      userSettings.hashCode ^
      locations.hashCode ^
      connectionStatus.hashCode ^
      loadingStatus.hashCode;

  GlobalAppState copyWith({
    WeatherStateRepository weatherData,
    int activeLocation,
    Location currentLocInfo,
    SettingsStateRepository userSettings,
    List<Location> locations,
    LoadingStatus connectionStatus,
    LoadingStatus loadingStatus,
  }) =>
      GlobalAppState(
        weatherData: weatherData ?? this.weatherData,
        activeLocation: activeLocation ?? this.activeLocation,
        currentLocInfo: currentLocInfo ?? this.currentLocInfo,
        userSettings: userSettings ?? this.userSettings,
        locations: locations ?? this.locations,
        connectionStatus: connectionStatus ?? this.connectionStatus,
        loadingStatus: loadingStatus ?? this.loadingStatus,
      );

  GlobalAppState.fromJson(Map<String, dynamic> json)
      : userSettings = SettingsStateRepository.fromJson(json['userSettings']),
        activeLocation = Entity.parseJsonInt(json['activeLocation']),
        connectionStatus = ConnectionStatus.Online,
        loadingStatus = LoadingStatus.Idle,
        currentLocInfo = Location.fromJson(json['currentLocInfo']),
        weatherData = WeatherStateRepository.fromJson(json['weatherData']),
        locations = (json['locations'] as List)
            .map((i) => Location.fromJson(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'userSettings': userSettings,
        'activeLocation': activeLocation,
        'weatherData': weatherData,
        'currentLocInfo': currentLocInfo,
        'locations': locations,
      };
}
