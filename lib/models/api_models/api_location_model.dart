import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class APILocation extends Entity<APILocation> {
  final String name;
  final String region;
  final String country;
  final double lat;
  final double long;
  final String tz_id;
  final int localtime_epoch;
  final String localtime;

  APILocation({
    @required this.name,
    @required this.region,
    @required this.country,
    @required this.lat,
    @required this.long,
    @required this.tz_id,
    @required this.localtime_epoch,
    @required this.localtime,
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
