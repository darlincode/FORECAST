// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

class AstrologicalStateRepository extends Entity<AstrologicalStateRepository> {
  final String moonPhase;
  final String sunrise;
  final String sunset;

  AstrologicalStateRepository({
    @required this.moonPhase,
    @required this.sunrise,
    @required this.sunset,
  });

  factory AstrologicalStateRepository.createEmpty() =>
      AstrologicalStateRepository(moonPhase: '', sunrise: '', sunset: '');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AstrologicalStateRepository &&
          other.moonPhase == moonPhase &&
          other.sunrise == sunrise &&
          other.sunset == sunset;

  @override
  int get hashCode => moonPhase.hashCode ^ sunrise.hashCode ^ sunset.hashCode;

  @override
  AstrologicalStateRepository copyWith({
    String moonPhase,
    String sunrise,
    String sunset,
  }) =>
      AstrologicalStateRepository(
          moonPhase: moonPhase ?? this.moonPhase,
          sunrise: sunrise ?? this.sunrise,
          sunset: sunset ?? this.sunset);

  @override
  Map<String, dynamic> toJson() => {
        'moonPhase': moonPhase ?? null,
        'sunrise': sunrise ?? null,
        'sunset': sunset ?? null,
      };

  @override
  AstrologicalStateRepository.fromJson(json)
      : moonPhase = json['moonPhase'] ?? '',
        sunrise = json['sunrise'] ?? '',
        sunset = json['sunset'] ?? '';

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid => moonPhase != null && sunrise != null && sunset != null;
}
