import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class WeatherDataList extends Entity<WeatherDataList> {
  final List<WeatherStateRepository> weatherDataList;

  WeatherDataList({
    @required this.weatherDataList,
  });

  @override
  factory WeatherDataList.createEmpty() => WeatherDataList(
        weatherDataList: List.unmodifiable([]),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherDataList && other.weatherDataList == weatherDataList;

  @override
  int get hashCode => weatherDataList.hashCode;

  @override
  WeatherDataList copyWith({
    List<WeatherStateRepository> weatherDataList,
  }) =>
      WeatherDataList(
        weatherDataList: weatherDataList ?? this.weatherDataList,
      );

  @override
  Map<String, dynamic> toJson() => {
        'weatherDataList': weatherDataList ?? null,
      };

  @override
  WeatherDataList.fromJson(json)
      : weatherDataList = (json['weatherDataList'] as List)
            .map((i) => WeatherStateRepository.fromJson(i))
            .toList();

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid => weatherDataList != null;
}
