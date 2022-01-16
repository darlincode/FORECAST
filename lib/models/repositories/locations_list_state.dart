import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class LocationList extends Entity<LocationList> {
  final List<SimpleLocation> locationList;

  LocationList({
    @required this.locationList,
  });

  @override
  factory LocationList.createEmpty() => LocationList(
        locationList: List.unmodifiable([]),
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocationList && other.locationList == locationList;

  @override
  int get hashCode => locationList.hashCode;

  @override
  LocationList copyWith({
    List<SimpleLocation> locationList,
  }) =>
      LocationList(
        locationList: locationList ?? this.locationList,
      );

  @override
  Map<String, dynamic> toJson() => {
        'locationList': locationList ?? null,
      };

  @override
  LocationList.fromJson(json)
      : locationList = (json['locationList'] as List)
            .map((i) => SimpleLocation.fromJson(i))
            .toList();

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid => locationList != null;
}
