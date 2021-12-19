// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

class DailyForecastData extends Entity<DailyForecastData> {
  final List<DateTime> dailyDate;
  final List<double> dailyHighsC;
  final List<double> dailyHighsF;
  final List<double> dailyHighsK;
  final List<double> dailyLowsC;
  final List<double> dailyLowsF;
  final List<double> dailyLowsK;
  final List<double> dailyHumidity;
  final List<double> dailyPop;
  final List<bool> dailyWillItRain;
  final List<String> dailyConditionString;
  final List<String> dailyConditionIconUrl;
  final List<int> dailyConditionCode;
  final List<double> dailyUv;

  DailyForecastData({
    @required this.dailyDate,
    @required this.dailyHighsC,
    @required this.dailyHighsF,
    @required this.dailyHighsK,
    @required this.dailyLowsC,
    @required this.dailyLowsF,
    @required this.dailyLowsK,
    @required this.dailyHumidity,
    @required this.dailyPop,
    @required this.dailyWillItRain,
    @required this.dailyConditionString,
    @required this.dailyConditionIconUrl,
    @required this.dailyConditionCode,
    @required this.dailyUv,
  });

  @override
  factory DailyForecastData.createEmpty() => DailyForecastData(
        dailyDate: [],
        dailyHighsC: [],
        dailyHighsF: [],
        dailyHighsK: [],
        dailyLowsC: [],
        dailyLowsF: [],
        dailyLowsK: [],
        dailyHumidity: [],
        dailyPop: [],
        dailyWillItRain: [],
        dailyConditionString: [],
        dailyConditionIconUrl: [],
        dailyConditionCode: [],
        dailyUv: [],
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DailyForecastData &&
          other.dailyDate == dailyDate &&
          other.dailyHighsC == dailyHighsC &&
          other.dailyHighsF == dailyHighsF &&
          other.dailyHighsK == dailyHighsK &&
          other.dailyLowsC == dailyLowsC &&
          other.dailyLowsF == dailyLowsF &&
          other.dailyLowsK == dailyLowsK &&
          other.dailyHumidity == dailyHumidity &&
          other.dailyPop == dailyPop &&
          other.dailyWillItRain == dailyWillItRain &&
          other.dailyConditionString == dailyConditionString &&
          other.dailyConditionCode == dailyConditionCode &&
          other.dailyConditionIconUrl == dailyConditionIconUrl &&
          other.dailyUv == dailyUv;

  @override
  int get hashCode =>
      dailyDate.hashCode ^
      dailyHighsC.hashCode ^
      dailyHighsF.hashCode ^
      dailyHighsK.hashCode ^
      dailyLowsC.hashCode ^
      dailyLowsF.hashCode ^
      dailyLowsK.hashCode ^
      dailyHumidity.hashCode ^
      dailyPop.hashCode ^
      dailyWillItRain.hashCode ^
      dailyConditionString.hashCode ^
      dailyConditionString.hashCode ^
      dailyConditionString.hashCode ^
      dailyUv.hashCode;

  @override
  DailyForecastData copyWith({
    List<DateTime> dailyDate,
    List<double> dailyHighsC,
    List<double> dailyHighsF,
    List<double> dailyHighsK,
    List<double> dailyLowsC,
    List<double> dailyLowsF,
    List<double> dailyLowsK,
    List<double> dailyHumidity,
    List<double> dailyPop,
    List<bool> dailyWillItRain,
    List<String> dailyConditionString,
    List<String> dailyConditionIconUrl,
    List<int> dailyConditionCode,
    List<double> dailyUv,
  }) =>
      DailyForecastData(
        dailyDate: dailyDate ?? this.dailyDate,
        dailyHighsC: dailyHighsC ?? this.dailyHighsC,
        dailyHighsF: dailyHighsF ?? this.dailyHighsF,
        dailyHighsK: dailyHighsK ?? this.dailyHighsK,
        dailyLowsC: dailyLowsC ?? this.dailyLowsC,
        dailyLowsF: dailyLowsF ?? this.dailyLowsF,
        dailyLowsK: dailyLowsK ?? this.dailyLowsK,
        dailyHumidity: dailyHumidity ?? this.dailyHumidity,
        dailyPop: dailyPop ?? this.dailyPop,
        dailyWillItRain: dailyWillItRain ?? this.dailyWillItRain,
        dailyConditionString: dailyConditionString ?? this.dailyConditionString,
        dailyConditionIconUrl:
            dailyConditionIconUrl ?? this.dailyConditionIconUrl,
        dailyConditionCode: dailyConditionCode ?? this.dailyConditionCode,
        dailyUv: dailyUv ?? this.dailyUv,
      );

  @override
  Map<String, dynamic> toJson() => {
        'dailyDate': dailyDate ?? null,
        'dailyHighsC': dailyHighsC ?? null,
        'dailyHighsF': dailyHighsF ?? null,
        'dailyHighsK': dailyHighsK ?? null,
        'dailyLowsC': dailyLowsC ?? null,
        'dailyLowsF': dailyLowsF ?? null,
        'dailyLowsK': dailyLowsK ?? null,
        'dailyHumidity': dailyHumidity ?? null,
        'dailyPop': dailyPop ?? null,
        'dailyWillItRain': dailyWillItRain ?? null,
        'dailyConditionString': dailyConditionString ?? null,
        'dailyConditionIconUrl': dailyConditionIconUrl ?? null,
        'dailyConditionCode': dailyConditionCode ?? null,
        'dailyUv': dailyUv ?? null,
      };

  @override
  DailyForecastData.fromJson(json)
      : dailyDate = List<DateTime>.from(json['dailyDate'] ?? []),
        dailyHighsC = List<double>.from(json['dailyHighsC']),
        dailyHighsF = List<double>.from(json['dailyHighsF']),
        dailyHighsK = List<double>.from(json['dailyHighsK']),
        dailyLowsC = List<double>.from(json['dailyLowsC']),
        dailyLowsF = List<double>.from(json['dailyLowsF']),
        dailyLowsK = List<double>.from(json['dailyLowsK']),
        dailyHumidity = List<double>.from(json['dailyHumidity']),
        dailyPop = List<double>.from(json['dailyPop']),
        dailyWillItRain = List<bool>.from(json['dailyWillItRain']),
        dailyConditionString = List<String>.from(json['dailyConditionString']),
        dailyConditionIconUrl =
            List<String>.from(json['dailyConditionIconUrl']),
        dailyConditionCode = List<int>.from(json['dailyConditionCode']),
        dailyUv = List<double>.from(json['dailyUv']);

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
      dailyPop != null &&
      dailyWillItRain != null &&
      dailyConditionString != null &&
      dailyConditionIconUrl != null &&
      dailyConditionCode != null &&
      dailyUv != null;
}
