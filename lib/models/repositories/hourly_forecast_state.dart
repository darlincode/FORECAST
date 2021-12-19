// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

class HourlyForecastStateRepository
    extends Entity<HourlyForecastStateRepository> {
  final int hourNow;
  final int nowPlusThreeHours;
  final int nowPlusSixHours;
  final int nowPlusNineHours;
  final int nowPlusTwelveHours;
  final int nowPlusFifteenHours;
  final int nowPlusEighteenHours;
  final List<double> hourlyTempC;
  final List<double> hourlyTempF;
  final List<double> hourlyTempK;
  final List<String> hourlyConditionIconUrl;
  final List<double> hourlyChanceOfRain;
  final List<double> hourlyWindSpeedKph;
  final List<double> hourlyWindSpeedMph;
  final List<double> hourlyWindSpeedMps;
  final List<double> hourlyWindSpeedKnots;
  final List<String> hourlyWindDegreeString;
  final List<int> hourlyWindDegree;

  HourlyForecastStateRepository({
    @required this.hourNow,
    @required this.nowPlusThreeHours,
    @required this.nowPlusSixHours,
    @required this.nowPlusNineHours,
    @required this.nowPlusTwelveHours,
    @required this.nowPlusFifteenHours,
    @required this.nowPlusEighteenHours,
    @required this.hourlyTempC,
    @required this.hourlyTempF,
    @required this.hourlyTempK,
    @required this.hourlyConditionIconUrl,
    @required this.hourlyChanceOfRain,
    @required this.hourlyWindSpeedKph,
    @required this.hourlyWindSpeedMph,
    @required this.hourlyWindSpeedMps,
    @required this.hourlyWindSpeedKnots,
    @required this.hourlyWindDegreeString,
    @required this.hourlyWindDegree,
  });

  @override
  factory HourlyForecastStateRepository.createEmpty() =>
      HourlyForecastStateRepository(
        hourNow: 0,
        nowPlusThreeHours: 0,
        nowPlusSixHours: 0,
        nowPlusNineHours: 0,
        nowPlusTwelveHours: 0,
        nowPlusFifteenHours: 0,
        nowPlusEighteenHours: 0,
        hourlyTempC: [],
        hourlyTempF: [],
        hourlyTempK: [],
        hourlyConditionIconUrl: [],
        hourlyChanceOfRain: [],
        hourlyWindSpeedKph: [],
        hourlyWindSpeedMph: [],
        hourlyWindSpeedMps: [],
        hourlyWindSpeedKnots: [],
        hourlyWindDegreeString: [],
        hourlyWindDegree: [],
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HourlyForecastStateRepository &&
          other.hourNow == hourNow &&
          other.nowPlusThreeHours == nowPlusThreeHours &&
          other.nowPlusSixHours == nowPlusSixHours &&
          other.nowPlusNineHours == nowPlusNineHours &&
          other.nowPlusTwelveHours == nowPlusTwelveHours &&
          other.nowPlusFifteenHours == nowPlusFifteenHours &&
          other.nowPlusEighteenHours == nowPlusEighteenHours &&
          other.hourlyTempC == hourlyTempC &&
          other.hourlyTempF == hourlyTempF &&
          other.hourlyTempK == hourlyTempK &&
          other.hourlyConditionIconUrl == hourlyConditionIconUrl &&
          other.hourlyChanceOfRain == hourlyChanceOfRain &&
          other.hourlyWindDegree == hourlyWindDegree &&
          other.hourlyWindSpeedKph == hourlyWindSpeedKph &&
          other.hourlyWindSpeedMph == hourlyWindSpeedMph &&
          other.hourlyWindSpeedMps == hourlyWindSpeedMps &&
          other.hourlyWindSpeedKnots == hourlyWindSpeedKnots &&
          other.hourlyWindDegreeString == hourlyWindDegreeString;

  @override
  int get hashCode =>
      hourNow.hashCode ^
      nowPlusThreeHours.hashCode ^
      nowPlusSixHours.hashCode ^
      nowPlusNineHours.hashCode ^
      nowPlusTwelveHours.hashCode ^
      nowPlusFifteenHours.hashCode ^
      nowPlusEighteenHours.hashCode ^
      hourlyTempC.hashCode ^
      hourlyTempF.hashCode ^
      hourlyTempK.hashCode ^
      hourlyConditionIconUrl.hashCode ^
      hourlyChanceOfRain.hashCode ^
      hourlyWindDegree.hashCode ^
      hourlyWindSpeedKph.hashCode ^
      hourlyWindSpeedMph.hashCode ^
      hourlyWindSpeedMps.hashCode ^
      hourlyWindSpeedKnots.hashCode ^
      hourlyWindDegreeString.hashCode;

  @override
  HourlyForecastStateRepository copyWith({
    int hourNow,
    int nowPlusThreeHours,
    int nowPlusSixHours,
    int nowPlusNineHours,
    int nowPlusTwelveHours,
    int nowPlusFifteenHours,
    int nowPlusEighteenHours,
    List<double> hourlyTempC,
    List<double> hourlyTempF,
    List<double> hourlyTempK,
    List<String> hourlyConditionIconUrl,
    List<double> hourlyChanceOfRain,
    List<double> hourlyWindSpeedKph,
    List<double> hourlyWindSpeedMph,
    List<double> hourlyWindSpeedMps,
    List<double> hourlyWindSpeedKnots,
    List<String> hourlyWindDegreeString,
    List<int> hourlyWindDegree,
  }) =>
      HourlyForecastStateRepository(
        hourNow: hourNow ?? this.hourNow,
        nowPlusThreeHours: nowPlusThreeHours ?? this.nowPlusThreeHours,
        nowPlusSixHours: nowPlusSixHours ?? this.nowPlusSixHours,
        nowPlusNineHours: nowPlusNineHours ?? this.nowPlusNineHours,
        nowPlusTwelveHours: nowPlusTwelveHours ?? this.nowPlusTwelveHours,
        nowPlusFifteenHours: nowPlusFifteenHours ?? this.nowPlusFifteenHours,
        nowPlusEighteenHours: nowPlusEighteenHours ?? this.nowPlusEighteenHours,
        hourlyTempC: hourlyTempC ?? this.hourlyTempC,
        hourlyTempF: hourlyTempF ?? this.hourlyTempF,
        hourlyTempK: hourlyTempK ?? this.hourlyTempK,
        hourlyConditionIconUrl:
            hourlyConditionIconUrl ?? this.hourlyConditionIconUrl,
        hourlyChanceOfRain: hourlyChanceOfRain ?? this.hourlyChanceOfRain,
        hourlyWindSpeedKph: hourlyWindSpeedKph ?? this.hourlyWindSpeedKph,
        hourlyWindSpeedMph: hourlyWindSpeedMph ?? this.hourlyWindSpeedMph,
        hourlyWindSpeedMps: hourlyWindSpeedMps ?? this.hourlyWindSpeedMps,
        hourlyWindSpeedKnots: hourlyWindSpeedKnots ?? this.hourlyWindSpeedKnots,
        hourlyWindDegreeString:
            hourlyWindDegreeString ?? this.hourlyWindDegreeString,
        hourlyWindDegree: hourlyWindDegree ?? this.hourlyWindDegree,
      );

  @override
  Map<String, dynamic> toJson() => {
        'hourNow': hourNow ?? null,
        'nowPlusThreeHours': nowPlusThreeHours ?? null,
        'nowPlusSixHours': nowPlusSixHours ?? null,
        'nowPlusNineHours': nowPlusNineHours ?? null,
        'nowPlusTwelveHours': nowPlusTwelveHours ?? null,
        'nowPlusFifteenHours': nowPlusFifteenHours ?? null,
        'nowPlusEighteenHours': nowPlusEighteenHours ?? null,
        'hourlyTempC': hourlyTempC ?? null,
        'hourlyTempF': hourlyTempF ?? null,
        'hourlyTempK': hourlyTempK ?? null,
        'hourlyConditionIconUrl': hourlyConditionIconUrl ?? null,
        'hourlyChanceOfRain': hourlyChanceOfRain ?? null,
        'hourlyWindSpeedKph': hourlyWindSpeedKph ?? null,
        'hourlyWindSpeedMph': hourlyWindSpeedMph ?? null,
        'hourlyWindSpeedMps': hourlyWindSpeedMps ?? null,
        'hourlyWindSpeedKnots': hourlyWindSpeedKnots ?? null,
        'hourlyWindDegreeString': hourlyWindDegreeString ?? null,
        'hourlyWindDegree': hourlyWindDegree ?? null,
      };

  @override
  HourlyForecastStateRepository.fromJson(json)
      : hourNow = Entity.parseJsonInt(json['hourNow']) ?? 0,
        nowPlusThreeHours = Entity.parseJsonInt(json['nowPlusThreeHours']) ?? 0,
        nowPlusSixHours = Entity.parseJsonInt(json['nowPlusSixHours']) ?? 0,
        nowPlusNineHours = Entity.parseJsonInt(json['nowPlusNineHours']) ?? 0,
        nowPlusTwelveHours =
            Entity.parseJsonInt(json['nowPlusTwelveHours']) ?? 0,
        nowPlusFifteenHours =
            Entity.parseJsonInt(json['nowPlusFifteenHours']) ?? 0,
        nowPlusEighteenHours =
            Entity.parseJsonInt(json['nowPlusEighteenHours']) ?? 0,
        hourlyTempC = List<double>.from(json['hourlyTempC']) ?? 0,
        hourlyTempF = List<double>.from(json['hourlyTempF']) ?? 0,
        hourlyTempK = List<double>.from(json['hourlyTempK']) ?? 0,
        hourlyConditionIconUrl =
            List<String>.from(json['hourlyConditionIconUrl']) ?? '',
        hourlyChanceOfRain = List<double>.from(json['hourlyChanceOfRain']) ?? 0,
        hourlyWindSpeedKph = List<double>.from(json['hourlyWindSpeedKph']) ?? 0,
        hourlyWindSpeedMph = List<double>.from(json['hourlyWindSpeedMph']) ?? 0,
        hourlyWindSpeedMps = List<double>.from(json['hourlyWindSpeedMps']) ?? 0,
        hourlyWindSpeedKnots =
            List<double>.from(json['hourlyWindSpeedKnots']) ?? 0,
        hourlyWindDegreeString =
            List<String>.from(json['hourlyWindDegreeString']) ?? '',
        hourlyWindDegree = List<int>.from(json['hourlyWindDegree']) ?? 0;

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      hourNow != null &&
      nowPlusThreeHours != null &&
      nowPlusSixHours != null &&
      nowPlusNineHours != null &&
      nowPlusTwelveHours != null &&
      nowPlusFifteenHours != null &&
      nowPlusEighteenHours != null &&
      hourlyTempC != null &&
      hourlyTempF != null &&
      hourlyTempK != null &&
      hourlyConditionIconUrl != null &&
      hourlyChanceOfRain != null &&
      hourlyWindDegree != null &&
      hourlyWindSpeedKph != null &&
      hourlyWindSpeedMph != null &&
      hourlyWindSpeedMps != null &&
      hourlyWindSpeedKnots != null &&
      hourlyWindDegreeString != null;
}

