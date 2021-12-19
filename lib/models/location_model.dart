import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';


@immutable
class Location extends Entity<Location> {
  final String cityName;
  final double latitude;
  final double longitude;
  final bool isActive;

  Location({
    @required this.cityName,
    @required this.latitude,
    @required this.longitude,
    @required this.isActive,
  });

  @override
  factory Location.createEmpty() => Location(
        cityName: 'Error',
        latitude: 0,
        longitude: 0,
        isActive: false,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Location &&
          other.cityName == cityName &&
          other.latitude == latitude &&
          other.longitude == longitude &&
          other.isActive == isActive;

  @override
  int get hashCode =>
      cityName.hashCode ^
      latitude.hashCode ^
      longitude.hashCode ^
      isActive.hashCode;

  @override
  Location copyWith({
    String cityName,
    double latitude,
    double longitude,
    bool isActive,
  }) =>
      Location(
        cityName: cityName ?? this.cityName,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        isActive: isActive ?? this.isActive,
      );

  @override
  Map<String, dynamic> toJson() => {
        'cityName': cityName ?? null,
        'latitude': latitude ?? null,
        'longitude': longitude ?? null,
        'isActive': isActive ?? null,
      };

  @override
  Location.fromJson(json)
      : cityName = json['cityName'] ?? '',
        latitude = Entity.parseJsonDouble(json['latitude']) ?? 0,
        longitude = Entity.parseJsonDouble(json['longitude']) ?? 0,
        isActive = Entity.parseJsonBool(json['isActive']) ?? false;

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      cityName != null &&
      latitude != null &&
      longitude != null &&
      isActive != null;
}
