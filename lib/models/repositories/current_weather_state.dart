// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

class CurrentWeatherStateRepository
    extends Entity<CurrentWeatherStateRepository> {
  final DateTime lastUpdated;
  final int lastUpdatedEpoch;
  final double tempC;
  final double tempF;
  final double tempK;
  final double feelsLikeC;
  final double feelsLikeF;
  final double feelsLikeK;
  final String conditionString;
  final String conditionIconUrl;
  final int conditionCode;
  final double humidity;
  final double uv;
  final double windSpeedMph;
  final double windSpeedKph;
  final double windSpeedKnots;
  final double windSpeedMps;
  final int windDirectionDegrees;
  final String windDirectionString;
  final double airPressureMbar;
  final double airPressureInch;
  final double airPressureKpa;
  final double airQualityCo;
  final double airQualityNo2;
  final double airQualityO3;
  final double airQualitySo2;
  final double airQualityPm25;
  final double airQualityPm10;
  final double airQualityUsEpaIndex;
  final double airQualityGbDefraIndex;

  CurrentWeatherStateRepository({
    @required this.lastUpdated,
    @required this.lastUpdatedEpoch,
    @required this.tempC,
    @required this.tempF,
    @required this.tempK,
    @required this.feelsLikeC,
    @required this.feelsLikeF,
    @required this.feelsLikeK,
    @required this.conditionString,
    @required this.conditionIconUrl,
    @required this.conditionCode,
    @required this.humidity,
    @required this.uv,
    @required this.windSpeedMph,
    @required this.windSpeedKph,
    @required this.windSpeedKnots,
    @required this.windSpeedMps,
    @required this.windDirectionDegrees,
    @required this.windDirectionString,
    @required this.airPressureMbar,
    @required this.airPressureInch,
    @required this.airPressureKpa,
    @required this.airQualityCo,
    @required this.airQualityNo2,
    @required this.airQualityO3,
    @required this.airQualitySo2,
    @required this.airQualityPm25,
    @required this.airQualityPm10,
    @required this.airQualityUsEpaIndex,
    @required this.airQualityGbDefraIndex,
  });

  factory CurrentWeatherStateRepository.createEmpty() =>
      CurrentWeatherStateRepository(
        lastUpdated: DateTime.now(),
        lastUpdatedEpoch: DateTime.now().millisecondsSinceEpoch,
        tempC: 0,
        tempF: 0,
        tempK: 0,
        feelsLikeC: 0,
        feelsLikeF: 0,
        feelsLikeK: 0,
        conditionString: '',
        conditionIconUrl: '',
        conditionCode: 0,
        humidity: 0,
        uv: 0,
        windSpeedMph: 0,
        windSpeedKph: 0,
        windSpeedKnots: 0,
        windSpeedMps: 0,
        windDirectionDegrees: 0,
        windDirectionString: '',
        airPressureMbar: 0,
        airPressureInch: 0,
        airPressureKpa: 0,
        airQualityCo: 0,
        airQualityNo2: 0,
        airQualityO3: 0,
        airQualitySo2: 0,
        airQualityPm25: 0,
        airQualityPm10: 0,
        airQualityUsEpaIndex: 0,
        airQualityGbDefraIndex: 0,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CurrentWeatherStateRepository &&
          other.lastUpdated == lastUpdated &&
          other.lastUpdatedEpoch == lastUpdatedEpoch &&
          other.tempC == tempC &&
          other.tempF == tempF &&
          other.tempK == tempK &&
          other.feelsLikeC == feelsLikeC &&
          other.feelsLikeF == feelsLikeF &&
          other.feelsLikeK == feelsLikeK &&
          other.conditionString == conditionString &&
          other.conditionIconUrl == conditionIconUrl &&
          other.conditionCode == conditionCode &&
          other.humidity == humidity &&
          other.uv == uv &&
          other.windSpeedKph == windSpeedKph &&
          other.windSpeedMph == windSpeedMph &&
          other.windSpeedMps == windSpeedMps &&
          other.windSpeedKnots == windSpeedKnots &&
          other.windDirectionDegrees == windDirectionDegrees &&
          other.windDirectionString == windDirectionString &&
          other.airPressureInch == airPressureInch &&
          other.airPressureKpa == airPressureKpa &&
          other.airPressureMbar == airPressureMbar &&
          other.airQualityCo == airQualityCo &&
          other.airQualityNo2 == airQualityNo2 &&
          other.airQualityO3 == airQualityO3 &&
          other.airQualitySo2 == airQualitySo2 &&
          other.airQualityPm25 == airQualityPm25 &&
          other.airQualityPm10 == airQualityPm10 &&
          other.airQualityUsEpaIndex == airQualityUsEpaIndex &&
          other.airQualityGbDefraIndex == airQualityGbDefraIndex;

  @override
  int get hashCode =>
      lastUpdated.hashCode ^
      lastUpdatedEpoch.hashCode ^
      tempC.hashCode ^
      tempF.hashCode ^
      tempK.hashCode ^
      feelsLikeC.hashCode ^
      feelsLikeF.hashCode ^
      feelsLikeK.hashCode ^
      conditionString.hashCode ^
      conditionIconUrl.hashCode ^
      conditionCode.hashCode ^
      humidity.hashCode ^
      uv.hashCode ^
      windSpeedKph.hashCode ^
      windSpeedMph.hashCode ^
      windSpeedMps.hashCode ^
      windSpeedKnots.hashCode ^
      windDirectionDegrees.hashCode ^
      windDirectionString.hashCode ^
      airPressureInch.hashCode ^
      airPressureMbar.hashCode ^
      airPressureKpa.hashCode ^
      airQualityCo.hashCode ^
      airQualityNo2.hashCode ^
      airQualityO3.hashCode ^
      airQualitySo2.hashCode ^
      airQualityPm25.hashCode ^
      airQualityPm10.hashCode ^
      airQualityUsEpaIndex.hashCode ^
      airQualityGbDefraIndex.hashCode;

  @override
  CurrentWeatherStateRepository copyWith({
    DateTime lastUpdated,
    int lastUpdatedEpoch,
    double tempC,
    double tempF,
    double tempK,
    double feelsLikeC,
    double feelsLikeF,
    double feelsLikeK,
    String conditionString,
    String conditionIconUrl,
    int conditionCode,
    double humidity,
    double uv,
    double windSpeedMph,
    double windSpeedKph,
    double windSpeedKnots,
    double windSpeedMps,
    int windDirectionDegrees,
    String windDirectionString,
    double airPressureMbar,
    double airPressureInch,
    double airPressureKpa,
    double airQualityCo,
    double airQualityNo2,
    double airQualityO3,
    double airQualitySo2,
    double airQualityPm25,
    double airQualityPm10,
    double airQualityUsEpaIndex,
    double airQualityGbDefraIndex,
  }) =>
      CurrentWeatherStateRepository(
        lastUpdated: lastUpdated ?? this.lastUpdated,
        lastUpdatedEpoch: lastUpdatedEpoch ?? this.lastUpdatedEpoch,
        tempC: tempC ?? this.tempC,
        tempF: tempF ?? this.tempF,
        tempK: tempK ?? this.tempK,
        feelsLikeC: feelsLikeC ?? this.feelsLikeC,
        feelsLikeF: feelsLikeF ?? this.feelsLikeF,
        feelsLikeK: feelsLikeK ?? this.feelsLikeK,
        conditionString: conditionString ?? this.conditionString,
        conditionIconUrl: conditionIconUrl ?? this.conditionIconUrl,
        conditionCode: conditionCode ?? this.conditionCode,
        humidity: humidity ?? this.humidity,
        uv: uv ?? this.uv,
        windSpeedMph: windSpeedMph ?? this.windSpeedMph,
        windSpeedKph: windSpeedKph ?? this.windSpeedKph,
        windSpeedKnots: windSpeedKnots ?? this.windSpeedKnots,
        windSpeedMps: windSpeedMps ?? this.windSpeedMps,
        windDirectionDegrees: windDirectionDegrees ?? this.windDirectionDegrees,
        windDirectionString: windDirectionString ?? this.windDirectionString,
        airPressureMbar: airPressureMbar ?? this.airPressureMbar,
        airPressureInch: airPressureInch ?? this.airPressureInch,
        airPressureKpa: airPressureKpa ?? this.airPressureKpa,
        airQualityCo: airQualityCo ?? this.airQualityCo,
        airQualityNo2: airQualityNo2 ?? this.airQualityNo2,
        airQualityO3: airQualityO3 ?? this.airQualityO3,
        airQualitySo2: airQualitySo2 ?? this.airQualitySo2,
        airQualityPm25: airQualityPm25 ?? this.airQualityPm25,
        airQualityPm10: airQualityPm10 ?? this.airQualityPm10,
        airQualityUsEpaIndex: airQualityUsEpaIndex ?? this.airQualityUsEpaIndex,
        airQualityGbDefraIndex:
            airQualityGbDefraIndex ?? this.airQualityGbDefraIndex,
      );

  @override
  Map<String, dynamic> toJson() => {
        'lastUpdated': lastUpdated ?? null,
        'lastUpdatedEpoch': lastUpdatedEpoch ?? null,
        'tempC': tempC ?? null,
        'tempF': tempF ?? null,
        'tempK': tempK ?? null,
        'feelsLikeC': feelsLikeC ?? null,
        'feelsLikeF': feelsLikeF ?? null,
        'feelsLikeK': feelsLikeK ?? null,
        'conditionString': conditionString ?? null,
        'conditionIconUrl': conditionIconUrl ?? null,
        'conditionCode': conditionCode ?? null,
        'humidity': humidity ?? null,
        'uv': uv ?? null,
        'windSpeedMph': windSpeedMph ?? null,
        'windSpeedKph': windSpeedKph ?? null,
        'windSpeedKnots': windSpeedKnots ?? null,
        'windSpeedMps': windSpeedMps ?? null,
        'windDirectionDegrees': windDirectionDegrees ?? null,
        'windDirectionString': windDirectionString ?? null,
        'airPressureMbar': airPressureMbar ?? null,
        'airPressureInch': airPressureInch ?? null,
        'airPressureKpa': airPressureKpa ?? null,
        'airQualityCo': airQualityCo ?? null,
        'airQualityNo2': airQualityNo2 ?? null,
        'airQualityO3': airQualityO3 ?? null,
        'airQualitySo2': airQualitySo2 ?? null,
        'airQualityPm25': airQualityPm25 ?? null,
        'airQualityPm10': airQualityPm10 ?? null,
        'airQualityUsEpaIndex': airQualityUsEpaIndex ?? null,
        'airQualityGbDefraIndex': airQualityGbDefraIndex ?? null,
      };

  @override
  CurrentWeatherStateRepository.fromJson(json)
      : lastUpdated =
            Entity.parseJsonDate(json['lastUpdated']) ?? DateTime.now(),
        lastUpdatedEpoch = Entity.parseJsonInt(json['lastUpdatedEpoch']) ?? 0,
        tempC = Entity.parseJsonDouble(json['tempC']) ?? 0,
        tempF = Entity.parseJsonDouble(json['tempF']) ?? 0,
        tempK = Entity.parseJsonDouble(json['tempK']) ?? 0,
        feelsLikeC = Entity.parseJsonDouble(json['feelsLikeC']) ?? 0,
        feelsLikeF = Entity.parseJsonDouble(json['feelsLikeF']) ?? 0,
        feelsLikeK = Entity.parseJsonDouble(json['feelsLikeK']) ?? 0,
        conditionString = json['conditionString'] ?? '',
        conditionIconUrl = json['conditionIconUrl'] ?? '',
        conditionCode = Entity.parseJsonInt(json['conditionCode']) ?? 0,
        humidity = Entity.parseJsonDouble(json['humidity']) ?? 0,
        uv = Entity.parseJsonDouble(json['uv']) ?? 0,
        windSpeedMph = Entity.parseJsonDouble(json['windSpeedMph']) ?? 0,
        windSpeedKph = Entity.parseJsonDouble(json['windSpeedKph']) ?? 0,
        windSpeedKnots = Entity.parseJsonDouble(json['windSpeedKnots']) ?? 0,
        windSpeedMps = Entity.parseJsonDouble(json['windSpeedMps']) ?? 0,
        windDirectionDegrees =
            Entity.parseJsonInt(json['windDirectionDegrees']) ?? 0,
        windDirectionString = json['windDirectionString'] ?? '',
        airPressureMbar = Entity.parseJsonDouble(json['airPressureMbar']) ?? 0,
        airPressureInch = Entity.parseJsonDouble(json['airPressureInch']) ?? 0,
        airPressureKpa = Entity.parseJsonDouble(json['airPressureKpa']) ?? 0,
        airQualityCo = Entity.parseJsonDouble(json['airQualityCo']) ?? 0,
        airQualityNo2 = Entity.parseJsonDouble(json['airQualityNo2']) ?? 0,
        airQualityO3 = Entity.parseJsonDouble(json['airQualityO3']) ?? 0,
        airQualitySo2 = Entity.parseJsonDouble(json['airQualitySo2']) ?? 0,
        airQualityPm25 = Entity.parseJsonDouble(json['airQualityPm25']) ?? 0,
        airQualityPm10 = Entity.parseJsonDouble(json['airQualityPm10']) ?? 0,
        airQualityUsEpaIndex =
            Entity.parseJsonDouble(json['airQualityUsEpaIndex']) ?? 0,
        airQualityGbDefraIndex =
            Entity.parseJsonDouble(json['airQualityGbDefraIndex']) ?? 0;

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      lastUpdated != null &&
      lastUpdatedEpoch != null &&
      tempC != null &&
      tempF != null &&
      tempK != null &&
      feelsLikeC != null &&
      feelsLikeF != null &&
      feelsLikeK != null &&
      conditionString != null &&
      conditionIconUrl != null &&
      conditionCode != null &&
      humidity != null &&
      uv != null &&
      windSpeedMph != null &&
      windSpeedKph != null &&
      windSpeedKnots != null &&
      windSpeedMps != null &&
      windDirectionDegrees != null &&
      windDirectionString != null &&
      airPressureMbar != null &&
      airPressureInch != null &&
      airPressureKpa != null &&
      airQualityCo != null &&
      airQualityNo2 != null &&
      airQualityO3 != null &&
      airQualitySo2 != null &&
      airQualityPm25 != null &&
      airQualityPm10 != null &&
      airQualityUsEpaIndex != null &&
      airQualityGbDefraIndex != null;
}
