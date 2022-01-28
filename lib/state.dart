import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class GlobalAppState {
  final int activeLocationIndex; // index of currently viewed location
  final List<SimpleLocation> locationList; // list of SimpleLocations
  final List<WeatherStateRepository>
      weatherDataList; // list of WeatherStateRepository
  final SettingsStateRepository userSettings; // user settings
  final LoadingStatus loadingStatus; // api loading status

  GlobalAppState(
      {@required this.weatherDataList,
      @required this.locationList,
      @required this.activeLocationIndex,
      @required this.loadingStatus,
      @required this.userSettings});

  GlobalAppState.initialState()
      : activeLocationIndex = 0,
        userSettings = SettingsStateRepository.createEmpty(),
        weatherDataList = [],
        locationList = [],
        loadingStatus = LoadingStatus.Idle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalAppState &&
          other.activeLocationIndex == activeLocationIndex &&
          other.userSettings == userSettings &&
          other.weatherDataList == weatherDataList &&
          other.locationList == locationList &&
          other.loadingStatus == loadingStatus;

  @override
  int get hashCode =>
      activeLocationIndex.hashCode ^
      userSettings.hashCode ^
      weatherDataList.hashCode ^
      locationList.hashCode ^
      loadingStatus.hashCode;

  GlobalAppState copyWith(
          {WeatherStateRepository weatherData,
          int activeLocationIndex,
          SettingsStateRepository userSettings,
          List<WeatherStateRepository> weatherDataList,
          List<SimpleLocation> locationList,
          LoadingStatus loadingStatus}) =>
      GlobalAppState(
          activeLocationIndex: activeLocationIndex ?? this.activeLocationIndex,
          userSettings: userSettings ?? this.userSettings,
          weatherDataList: weatherDataList ?? this.weatherDataList,
          locationList: locationList ?? this.locationList,
          loadingStatus: loadingStatus ?? this.loadingStatus);

  GlobalAppState.fromJson(Map<String, dynamic> json)
      : userSettings = SettingsStateRepository.fromJson(json['userSettings']),
        activeLocationIndex = Entity.parseJsonInt(json['activeLocationIndex']),
        loadingStatus = LoadingStatus.Idle,
        weatherDataList = List.unmodifiable([]),
        locationList = (json['locationList'] as List)
            .map((i) => SimpleLocation.fromJson(i))
            .toList();

  Map<String, dynamic> toJson() => {
        'userSettings': userSettings,
        'activeLocationIndex': activeLocationIndex,
        'locationList': locationList
      };
}
