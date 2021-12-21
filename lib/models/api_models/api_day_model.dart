import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class APIDay extends Entity<APIDay> {
  final double maxtemp_c;
  final double maxtemp_f;
  final double mintemp_c;
  final double mintemp_f;
  final int avghumidity;
  final int daily_will_it_rain;
  final int daily_chance_of_rain;
  final APICondition condition;
  final int uv;
  final APIAQI air_quality;

  APIDay({
    @required this.maxtemp_c,
    @required this.maxtemp_f,
    @required this.mintemp_c,
    @required this.mintemp_f,
    @required this.avghumidity,
    @required this.daily_will_it_rain,
    @required this.daily_chance_of_rain,
    @required this.condition,
    @required this.uv,
    @required this.air_quality,
  });

  @override
  factory APIDay.createEmpty() => APIDay(
        maxtemp_c: null,
        maxtemp_f: null,
        mintemp_c: null,
        mintemp_f: null,
        avghumidity: null,
        daily_will_it_rain: null,
        daily_chance_of_rain: null,
        condition: null,
        uv: null,
        air_quality: null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APIDay &&
          other.maxtemp_c == maxtemp_c &&
          other.maxtemp_f == maxtemp_f &&
          other.mintemp_c == mintemp_c &&
          other.mintemp_f == mintemp_f &&
          other.avghumidity == avghumidity &&
          other.daily_will_it_rain == daily_will_it_rain &&
          other.daily_chance_of_rain == daily_chance_of_rain &&
          other.condition == condition &&
          other.uv == uv &&
          other.air_quality == air_quality;

  @override
  int get hashCode =>
      maxtemp_c.hashCode ^
      maxtemp_f.hashCode ^
      mintemp_c.hashCode ^
      mintemp_f.hashCode ^
      avghumidity.hashCode ^
      daily_will_it_rain.hashCode ^
      daily_chance_of_rain.hashCode ^
      condition.hashCode ^
      uv.hashCode ^
      air_quality.hashCode;

  @override
  APIDay copyWith({
    double maxtemp_c,
    double maxtemp_f,
    double mintemp_c,
    double mintemp_f,
    int avghumidity,
    int daily_will_it_rain,
    int daily_chance_of_rain,
    APICondition condition,
    int uv,
    APIAQI air_quality,
  }) =>
      APIDay(
        maxtemp_c: maxtemp_c ?? this.maxtemp_c,
        maxtemp_f: maxtemp_f ?? this.maxtemp_f,
        mintemp_c: mintemp_c ?? this.mintemp_c,
        mintemp_f: mintemp_f ?? this.mintemp_f,
        avghumidity: avghumidity ?? this.avghumidity,
        daily_will_it_rain: daily_will_it_rain ?? this.daily_will_it_rain,
        daily_chance_of_rain: daily_chance_of_rain ?? this.daily_chance_of_rain,
        condition: condition ?? this.condition,
        uv: uv ?? this.uv,
        air_quality: air_quality ?? this.air_quality,
      );

  @override
  Map<String, dynamic> toJson() => {
        'maxtemp_c': maxtemp_c,
        'maxtemp_f': maxtemp_f,
        'mintemp_c': mintemp_c,
        'mintemp_f': mintemp_f,
        'avghumidity': avghumidity,
        'daily_will_it_rain': daily_will_it_rain,
        'daily_chance_of_rain': daily_chance_of_rain,
        'condition': condition,
        'uv': uv,
        'air_quality': air_quality,
      };

  @override
  APIDay.fromJson(json)
      : maxtemp_c = json['maxtemp_c'],
        maxtemp_f = json['maxtemp_f'],
        mintemp_c = json['mintemp_c'],
        mintemp_f = json['mintemp_f'],
        avghumidity = json['avghumidity'],
        daily_will_it_rain = json['daily_will_it_rain'],
        daily_chance_of_rain = json['daily_chance_of_rain'],
        condition = json['condition'],
        uv = json['uv'],
        air_quality = json['air_quality'];

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      maxtemp_c != null &&
      maxtemp_f != null &&
      mintemp_c != null &&
      mintemp_f != null &&
      avghumidity != null &&
      daily_will_it_rain != null &&
      daily_chance_of_rain != null &&
      condition != null &&
      uv != null &&
      air_quality != null;
}
