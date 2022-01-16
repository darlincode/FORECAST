import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class APILocation extends Entity<APILocation> {
  final String name, region, country, tz_id, localtime;
  final double lat, long;
  final int localtime_epoch;

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

  @override
  factory APILocation.createEmpty() => APILocation(
        name: null,
        region: null,
        country: null,
        lat: null,
        long: null,
        tz_id: null,
        localtime_epoch: null,
        localtime: null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is APILocation &&
          other.name == name &&
          other.region == region &&
          other.country == country &&
          other.lat == lat &&
          other.long == long &&
          other.tz_id == tz_id &&
          other.localtime_epoch == localtime_epoch &&
          other.localtime == localtime;

  @override
  int get hashCode =>
      name.hashCode ^
      region.hashCode ^
      country.hashCode ^
      lat.hashCode ^
      long.hashCode ^
      tz_id.hashCode ^
      localtime_epoch.hashCode ^
      localtime.hashCode;

  @override
  APILocation copyWith({
    String name,
    String region,
    String country,
    double lat,
    double long,
    String tz_id,
    int localtime_epoch,
    String localtime,
  }) =>
      APILocation(
        name: name ?? this.name,
        region: region ?? this.region,
        country: country ?? this.country,
        lat: lat ?? this.lat,
        long: long ?? this.long,
        tz_id: tz_id ?? this.tz_id,
        localtime_epoch: localtime_epoch ?? this.localtime_epoch,
        localtime: localtime ?? this.localtime,
      );

  @override
  Map<String, dynamic> toJson() => {
        'name': name,
        'region': region,
        'country': country,
        'lat': lat,
        'long': long,
        'tz_id': tz_id,
        'localtime_epoch': localtime_epoch,
        'localtime': localtime,
      };

  @override
  APILocation.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        region = json['region'],
        country = json['country'],
        lat = Entity.parseJsonDouble(json['lat']),
        long = Entity.parseJsonDouble(json['long']),
        tz_id = json['tz_id'],
        localtime_epoch = Entity.parseJsonInt(json['localtime_epoch']),
        localtime = json['localtime'];

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      name != null &&
      region != null &&
      country != null &&
      lat != null &&
      long != null &&
      tz_id != null &&
      localtime_epoch != null &&
      localtime != null;
}
