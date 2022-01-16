import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

class SimpleLocation extends Entity<SimpleLocation> {
  final double latitude, longitude;
  final String id;

  SimpleLocation({
    @required this.id,
    @required this.latitude,
    @required this.longitude,
  });

  @override
  factory SimpleLocation.createEmpty() => SimpleLocation(
        id: Uuid().v4(),
        latitude: null,
        longitude: null,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SimpleLocation &&
          other.id == id &&
          other.latitude == latitude &&
          other.longitude == longitude;

  @override
  int get hashCode => id.hashCode ^ latitude.hashCode ^ longitude.hashCode;

  @override
  SimpleLocation copyWith({
    String id,
    double latitude,
    double longitude,
  }) =>
      SimpleLocation(
        id: id ?? this.id,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
      );

  @override
  Map<String, dynamic> toJson() => {
        'id': id,
        'latitude': latitude,
        'longitude': longitude,
      };

  @override
  SimpleLocation.fromJson(json)
      : id = json['id'],
        latitude = json['latitude'],
        longitude = json['longitude'];

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid => id != null && latitude != null && longitude != null;
}
