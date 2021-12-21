import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class APICurrentConditions extends Entity<APICurrentConditions> {
  final int last_updated_epoch;
  final String last_updated;
  final double temp_c;
  final double temp_f;
  final bool is_day;
  final APICondition condition;
  final double wind_mph;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final int pressure_mb;
  final double pressure_in;
  final int humidity;
  final double feelslike_c;
  final double feelslike_f;
  final int uv;
  final APIAQI air_quality;

  APICurrentConditions({
    @required this.last_updated_epoch,
    @required this.last_updated,
    @required this.temp_c,
    @required this.temp_f,
    @required this.is_day,
    @required this.condition,
    @required this.wind_mph,
    @required this.wind_kph,
    @required this.wind_degree,
    @required this.wind_dir,
    @required this.pressure_mb,
    @required this.pressure_in,
    @required this.humidity,
    @required this.feelslike_c,
    @required this.feelslike_f,
    @required this.uv,
    @required this.air_quality,
  });
  @override
  factory APICurrentConditions.createEmpty() => APICurrentConditions(
        last_updated_epoch: null,
        last_updated: null,
        temp_c: null,
        temp_f: null,
        is_day: null,
        condition: null,
        wind_mph: null,
        wind_kph: null,
        wind_degree: null,
        wind_dir: null,
        pressure_mb: null,
        pressure_in: null,
        humidity: null,
        feelslike_c: null,
        feelslike_f: null,
        uv: null,
        air_quality: null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APICurrentConditions &&
          other.last_updated_epoch == last_updated_epoch &&
          other.last_updated == last_updated &&
          other.temp_c == temp_c &&
          other.temp_f == temp_f &&
          other.is_day == is_day &&
          other.condition == condition &&
          other.wind_mph == wind_mph &&
          other.wind_kph == wind_kph &&
          other.wind_degree == wind_degree &&
          other.wind_dir == wind_dir &&
          other.pressure_mb == pressure_mb &&
          other.pressure_in == pressure_in &&
          other.humidity == humidity &&
          other.feelslike_c == feelslike_c &&
          other.feelslike_f == feelslike_f &&
          other.uv == uv &&
          other.air_quality == air_quality;

  @override
  int get hashCode =>
      last_updated_epoch.hashCode ^
      last_updated.hashCode ^
      temp_c.hashCode ^
      temp_f.hashCode ^
      is_day.hashCode ^
      condition.hashCode ^
      wind_mph.hashCode ^
      wind_kph.hashCode ^
      wind_degree.hashCode ^
      wind_dir.hashCode ^
      pressure_mb.hashCode ^
      pressure_in.hashCode ^
      humidity.hashCode ^
      feelslike_c.hashCode ^
      feelslike_f.hashCode ^
      uv.hashCode ^
      air_quality.hashCode;

  @override
  APICurrentConditions copyWith({
    int last_updated_epoch,
    String last_updated,
    double temp_c,
    double temp_f,
    bool is_day,
    APICondition condition,
    double wind_mph,
    double wind_kph,
    int wind_degree,
    String wind_dir,
    int pressure_mb,
    double pressure_in,
    int humidity,
    double feelslike_c,
    double feelslike_f,
    int uv,
    APIAQI air_quality,
  }) =>
      APICurrentConditions(
        last_updated_epoch: last_updated_epoch ?? this.last_updated_epoch,
        last_updated: last_updated ?? this.last_updated,
        temp_c: temp_c ?? this.temp_c,
        temp_f: temp_f ?? this.temp_f,
        is_day: is_day ?? this.is_day,
        condition: condition ?? this.condition,
        wind_mph: wind_mph ?? this.wind_mph,
        wind_kph: wind_kph ?? this.wind_kph,
        wind_degree: wind_degree ?? this.wind_degree,
        wind_dir: wind_dir ?? this.wind_dir,
        pressure_mb: pressure_mb ?? this.pressure_mb,
        pressure_in: pressure_in ?? this.pressure_in,
        humidity: humidity ?? this.humidity,
        feelslike_c: feelslike_c ?? this.feelslike_c,
        feelslike_f: feelslike_f ?? this.feelslike_f,
        uv: uv ?? this.uv,
        air_quality: air_quality ?? this.air_quality,
      );

  @override
  Map<String, dynamic> toJson() => {
        'last_updated_epoch': last_updated_epoch,
        'last_updated': last_updated,
        'temp_c': temp_c,
        'temp_f': temp_f,
        'is_day': is_day,
        'condition': condition,
        'wind_mph': wind_mph,
        'wind_kph': wind_kph,
        'wind_degree': wind_degree,
        'wind_dir': wind_dir,
        'pressure_mb': pressure_mb,
        'pressure_in': pressure_in,
        'humidity': humidity,
        'feelslike_c': feelslike_c,
        'feelslike_f': feelslike_f,
        'uv': uv,
        'air_quality': air_quality,
      };

  @override
  APICurrentConditions.fromJson(json)
      : last_updated_epoch = json['last_updated_epoch'],
        last_updated = json['last_updated'],
        temp_c = json['temp_c'],
        temp_f = json['temp_f'],
        is_day = json['is_day'],
        condition = json['condition'],
        wind_mph = json['wind_mph'],
        wind_kph = json['wind_kph'],
        wind_degree = json['wind_degree'],
        wind_dir = json['wind_dir'],
        pressure_mb = json['pressure_mb'],
        pressure_in = json['pressure_in'],
        humidity = json['humidity'],
        feelslike_c = json['feelslike_c'],
        feelslike_f = json['feelslike_f'],
        uv = json['uv'],
        air_quality = json['air_quality'];

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      last_updated_epoch != null &&
      last_updated != null &&
      temp_c != null &&
      temp_f != null &&
      is_day != null &&
      condition != null &&
      wind_mph != null &&
      wind_kph != null &&
      wind_degree != null &&
      wind_dir != null &&
      pressure_mb != null &&
      pressure_in != null &&
      humidity != null &&
      feelslike_c != null &&
      feelslike_f != null &&
      uv != null &&
      air_quality != null;
}
