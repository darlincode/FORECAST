import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class Location extends Entity<Location> {
  final double latitude;
  final double longitude;

  Location({
    @required this.latitude,
    @required this.longitude,
  });

  @override
  factory Location.createEmpty() => Location(
        latitude: 0,
        longitude: 0,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          other.latitude == latitude &&
          other.longitude == longitude;

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  Location copyWith({
    double latitude,
    double longitude,
    bool isActive,
  }) =>
      Location(
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  @override
  Map<String, dynamic> toJson() => {
        'latitude': latitude ?? null,
        'longitude': longitude ?? null,
      };

  @override
  Location.fromJson(json)
      : latitude = Entity.parseJsonDouble(json['latitude']) ?? 0,
        longitude = Entity.parseJsonDouble(json['longitude']) ?? 0;

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid => latitude != null && longitude != null;
}
