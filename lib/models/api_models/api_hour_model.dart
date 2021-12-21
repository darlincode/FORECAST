import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class APIHour extends Entity<APIHour> {
  final int time_epoch;
  final String time;
  final double temp_c;
  final double temp_f;
  final APICondition condition;
  final double wind_mph;
  final double wind_kph;
  final int wind_degree;
  final String wind_dir;
  final int pressure_mb;
  final double pressure_in;
  final int humidity;
  final int cloud;
  final double feelslike_c;
  final double feelslike_f;
  final bool will_it_rain;
  final int chance_of_rain;
  final bool will_it_snow;
  final int uv;
  final APIAQI air_quality;

  APIHour({
    @required this.time_epoch,
    @required this.time,
    @required this.temp_c,
    @required this.temp_f,
    @required this.condition,
    @required this.wind_mph,
    @required this.wind_kph,
    @required this.wind_degree,
    @required this.wind_dir,
    @required this.pressure_mb,
    @required this.pressure_in,
    @required this.humidity,
    @required this.cloud,
    @required this.feelslike_c,
    @required this.feelslike_f,
    @required this.will_it_rain,
    @required this.chance_of_rain,
    @required this.will_it_snow,
    @required this.uv,
    @required this.air_quality,
  });

  // TODO: Add createEmpty()
  // TODO: Add ==
  // TODO: Add hashCode
  // TODO: Add copyWith
  // TODO: Add toJson
  // TODO: Add fromJson
  // TODO: Add isNotValid
  // TODO: Add isValid
}
