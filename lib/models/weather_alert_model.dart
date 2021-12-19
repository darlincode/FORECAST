// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

class WeatherAlert extends Entity<WeatherAlert> {
  final bool alertInEffect;
  final String alertHeadline;
  final String alertType;
  final String alertUrgency;
  final String alertAreas;
  final String alertEvent;
  final String alertNote;
  final String alertCertainty;
  final String alertDescription;
  final String alertInstructions;

  WeatherAlert({
    @required this.alertInEffect,
    @required this.alertHeadline,
    @required this.alertType,
    @required this.alertUrgency,
    @required this.alertAreas,
    @required this.alertEvent,
    @required this.alertNote,
    @required this.alertCertainty,
    @required this.alertDescription,
    @required this.alertInstructions,
  });

  @override
  factory WeatherAlert.createEmpty() => WeatherAlert(
      alertInEffect: false,
      alertHeadline: '',
      alertType: '',
      alertUrgency: '',
      alertAreas: '',
      alertEvent: '',
      alertNote: '',
      alertCertainty: '',
      alertDescription: '',
      alertInstructions: '');

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WeatherAlert &&
          other.alertInEffect == alertInEffect &&
          other.alertHeadline == alertHeadline &&
          other.alertType == alertType &&
          other.alertUrgency == alertUrgency &&
          other.alertAreas == alertAreas &&
          other.alertEvent == alertEvent &&
          other.alertNote == alertNote &&
          other.alertCertainty == alertCertainty &&
          other.alertDescription == alertDescription &&
          other.alertInstructions == alertInstructions;

  @override
  int get hashCode =>
      alertInEffect.hashCode ^
      alertHeadline.hashCode ^
      alertType.hashCode ^
      alertUrgency.hashCode ^
      alertAreas.hashCode ^
      alertEvent.hashCode ^
      alertNote.hashCode ^
      alertCertainty.hashCode ^
      alertDescription.hashCode ^
      alertInstructions.hashCode;

  @override
  WeatherAlert copyWith({
    bool alertInEffect,
    String alertHeadline,
    String alertType,
    String alertUrgency,
    String alertAreas,
    String alertEvent,
    String alertNote,
    String alertCertainty,
    String alertDescription,
    String alertInstructions,
  }) =>
      WeatherAlert(
        alertInEffect: alertInEffect ?? this.alertInEffect,
        alertHeadline: alertHeadline ?? this.alertHeadline,
        alertType: alertType ?? this.alertType,
        alertUrgency: alertUrgency ?? this.alertUrgency,
        alertAreas: alertAreas ?? this.alertAreas,
        alertEvent: alertEvent ?? this.alertEvent,
        alertNote: alertNote ?? this.alertNote,
        alertCertainty: alertCertainty ?? this.alertCertainty,
        alertDescription: alertDescription ?? this.alertDescription,
        alertInstructions: alertInstructions ?? this.alertInstructions,
      );

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      alertInEffect != null &&
      alertHeadline != null &&
      alertType != null &&
      alertUrgency != null &&
      alertAreas != null &&
      alertEvent != null &&
      alertNote != null &&
      alertCertainty != null &&
      alertDescription != null &&
      alertInstructions != null;

  @override
  Map<String, dynamic> toJson() => {
        'alertInEffect': alertInEffect ?? null,
        'alertHeadline': alertHeadline ?? null,
        'alertType': alertType ?? null,
        'alertUrgency': alertUrgency ?? null,
        'alertAreas': alertAreas ?? null,
        'alertEvent': alertEvent ?? null,
        'alertNote': alertNote ?? null,
        'alertCertainty': alertCertainty ?? null,
        'alertDescription': alertDescription ?? null,
        'alertInstructions': alertInstructions ?? null,
      };

  @override
  WeatherAlert.fromJson(json)
      : alertInEffect = Entity.parseJsonBool(json = ['alertInEffect']) ?? false,
        alertHeadline = json = ['alertHeadline'] ?? '',
        alertType = json = ['alertType'] ?? '',
        alertUrgency = json = ['alertUrgency'] ?? '',
        alertAreas = json = ['alertAreas'] ?? '',
        alertEvent = json = ['alertEvent'] ?? '',
        alertNote = json = ['alertNote'] ?? '',
        alertCertainty = json = ['alertCertainty'] ?? '',
        alertDescription = json = ['alertDescription'] ?? '',
        alertInstructions = json = ['alertInstructions'] ?? '';
}
