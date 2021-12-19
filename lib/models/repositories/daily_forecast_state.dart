// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

class DailyForecastStateRepository
    extends Entity<DailyForecastStateRepository> {
  final List<DateTime> dailyDates;
  final List<double> dailyHighsC;
  final List<double> dailyHighsF;
  final List<double> dailyHighsK;
  final List<double> dailyLowsC;
  final List<double> dailyLowsF;
  final List<double> dailyLowsK;
  final List<double> dailyHumidity;
  final List<double> dailyChanceOfRain;
  final List<bool> dailyWillItRain;
  final List<String> dailyConditionStrings;
  final List<String> dailyConditionIconUrls;
  final List<int> dailyConditionCodes;
  final List<double> dailyUV;

  DailyForecastStateRepository({
    @required this.dailyDates,
    @required this.dailyHighsC,
    @required this.dailyHighsF,
    @required this.dailyHighsK,
    @required this.dailyLowsC,
    @required this.dailyLowsF,
    @required this.dailyLowsK,
    @required this.dailyHumidity,
    @required this.dailyChanceOfRain,
    @required this.dailyWillItRain,
    @required this.dailyConditionStrings,
    @required this.dailyConditionIconUrls,
    @required this.dailyConditionCodes,
    @required this.dailyUV,
  });

  @override
  factory DailyForecastStateRepository.createEmpty() =>
      DailyForecastStateRepository(
        dailyDates: [],
        dailyHighsC: [],
        dailyHighsF: [],
        dailyHighsK: [],
        dailyLowsC: [],
        dailyLowsF: [],
        dailyLowsK: [],
        dailyHumidity: [],
        dailyChanceOfRain: [],
        dailyWillItRain: [],
        dailyConditionStrings: [],
        dailyConditionIconUrls: [],
        dailyConditionCodes: [],
        dailyUV: [],
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyForecastStateRepository &&
          other.dailyDates == dailyDates &&
          other.dailyHighsC == dailyHighsC &&
          other.dailyHighsF == dailyHighsF &&
          other.dailyHighsK == dailyHighsK &&
          other.dailyLowsC == dailyLowsC &&
          other.dailyLowsF == dailyLowsF &&
          other.dailyLowsK == dailyLowsK &&
          other.dailyHumidity == dailyHumidity &&
          other.dailyChanceOfRain == dailyChanceOfRain &&
          other.dailyWillItRain == dailyWillItRain &&
          other.dailyConditionStrings == dailyConditionStrings &&
          other.dailyConditionCodes == dailyConditionCodes &&
          other.dailyConditionIconUrls == dailyConditionIconUrls &&
          other.dailyUV == dailyUV;

  @override
  int get hashCode =>
      dailyDates.hashCode ^
      dailyHighsC.hashCode ^
      dailyHighsF.hashCode ^
      dailyHighsK.hashCode ^
      dailyLowsC.hashCode ^
      dailyLowsF.hashCode ^
      dailyLowsK.hashCode ^
      dailyHumidity.hashCode ^
      dailyChanceOfRain.hashCode ^
      dailyWillItRain.hashCode ^
      dailyConditionStrings.hashCode ^
      dailyConditionStrings.hashCode ^
      dailyConditionStrings.hashCode ^
      dailyUV.hashCode;

  @override
  DailyForecastStateRepository copyWith({
    List<DateTime> dailyDates,
    List<double> dailyHighsC,
    List<double> dailyHighsF,
    List<double> dailyHighsK,
    List<double> dailyLowsC,
    List<double> dailyLowsF,
    List<double> dailyLowsK,
    List<double> dailyHumidity,
    List<double> dailyChanceOfRain,
    List<bool> dailyWillItRain,
    List<String> dailyConditionStrings,
    List<String> dailyConditionIconUrl,
    List<int> dailyConditionCode,
    List<double> dailyUv,
  }) =>
      DailyForecastStateRepository(
        dailyDates: dailyDates ?? this.dailyDates,
        dailyHighsC: dailyHighsC ?? this.dailyHighsC,
        dailyHighsF: dailyHighsF ?? this.dailyHighsF,
        dailyHighsK: dailyHighsK ?? this.dailyHighsK,
        dailyLowsC: dailyLowsC ?? this.dailyLowsC,
        dailyLowsF: dailyLowsF ?? this.dailyLowsF,
        dailyLowsK: dailyLowsK ?? this.dailyLowsK,
        dailyHumidity: dailyHumidity ?? this.dailyHumidity,
        dailyChanceOfRain: dailyChanceOfRain ?? this.dailyChanceOfRain,
        dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
        dailyConditionStrings:
            dailyConditionStrings ?? this.dailyConditionStrings,
        dailyConditionIconUrls:
            dailyConditionIconUrl ?? this.dailyConditionIconUrls,
        dailyConditionCodes: dailyConditionCode ?? this.dailyConditionCodes,
        dailyUV: dailyUv ?? this.dailyUV,
      );

  @override
  Map<String, dynamic> toJson() => {
        'dailyDates': dailyDates ?? null,
        'dailyHighsC': dailyHighsC ?? null,
        'dailyHighsF': dailyHighsF ?? null,
        'dailyHighsK': dailyHighsK ?? null,
        'dailyLowsC': dailyLowsC ?? null,
        'dailyLowsF': dailyLowsF ?? null,
        'dailyLowsK': dailyLowsK ?? null,
        'dailyHumidity': dailyHumidity ?? null,
        'dailyChanceOfRain': dailyChanceOfRain ?? null,
        'dailyWillItRain': dailyWillItRain ?? null,
        'dailyConditionStrings': dailyConditionStrings ?? null,
        'dailyConditionIconUrls': dailyConditionIconUrls ?? null,
        'dailyConditionCodes': dailyConditionCodes ?? null,
        'dailyUv': dailyUV ?? null,
      };

  @override
  DailyForecastStateRepository.fromJson(json)
      : dailyDates = List<DateTime>.from(json['dailyDates']) ?? [],
        dailyHighsC = List<double>.from(json['dailyHighsC']) ?? [],
        dailyHighsF = List<double>.from(json['dailyHighsF']) ?? [],
        dailyHighsK = List<double>.from(json['dailyHighsK']) ?? [],
        dailyLowsC = List<double>.from(json['dailyLowsC']) ?? [],
        dailyLowsF = List<double>.from(json['dailyLowsF']) ?? [],
        dailyLowsK = List<double>.from(json['dailyLowsK']) ?? [],
        dailyHumidity = List<double>.from(json['dailyHumidity']) ?? [],
        dailyChanceOfRain = List<double>.from(json['dailyChanceOfRain']) ?? [],
        dailyWillItRain = List<bool>.from(json['dailyWillItRain']) ?? [],
        dailyConditionStrings =
            List<String>.from(json['dailyConditionStrings']) ?? [],
        dailyConditionIconUrls =
            List<String>.from(json['dailyConditionIconUrls']) ?? [],
        dailyConditionCodes = List<int>.from(json['dailyConditionCodes']) ?? [],
        dailyUV = List<double>.from(json['dailyUv']) ?? [];

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      dailyHighsC != null &&
      dailyHighsF != null &&
      dailyHighsK != null &&
      dailyLowsC != null &&
      dailyLowsF != null &&
      dailyLowsK != null &&
      dailyHumidity != null &&
      dailyChanceOfRain != null &&
      dailyWillItRain != null &&
      dailyConditionStrings != null &&
      dailyConditionIconUrls != null &&
      dailyConditionCodes != null &&
      dailyUV != null;
}
