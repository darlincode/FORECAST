import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// User settings repository
@immutable
class SettingsStateRepository extends Entity<SettingsStateRepository> {
  final bool useDarkMode;
  final TempUnits tempUnits;
  final WindSpeedUnits windSpeedUnits;
  final AirPressureUnits airPressureUnits;
  final bool useAnimatedBackgrounds;

  SettingsStateRepository({
    @required this.useDarkMode,
    @required this.useAnimatedBackgrounds,
    @required this.tempUnits,
    @required this.windSpeedUnits,
    @required this.airPressureUnits,
  });

  // These are the default settings for a fresh clean SettingsStateRepository
  factory SettingsStateRepository.createEmpty() => SettingsStateRepository(
        useDarkMode: false,
        useAnimatedBackgrounds: true,
        tempUnits: TempUnits.C,
        windSpeedUnits: WindSpeedUnits.Kph,
        airPressureUnits: AirPressureUnits.Kpa,
      );

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SettingsStateRepository &&
          other.useDarkMode == useDarkMode &&
          other.useAnimatedBackgrounds == useAnimatedBackgrounds &&
          other.tempUnits == tempUnits &&
          other.windSpeedUnits == windSpeedUnits &&
          other.airPressureUnits == airPressureUnits;

  @override
  int get hashCode =>
      useDarkMode.hashCode ^
      useAnimatedBackgrounds.hashCode ^
      tempUnits.hashCode ^
      windSpeedUnits.hashCode ^
      airPressureUnits.hashCode;

  SettingsStateRepository copyWith({
    bool useDarkMode,
    bool useAnimatedBackgrounds,
    TempUnits tempUnits,
    WindSpeedUnits windSpeedUnits,
    AirPressureUnits airPressureUnits,
  }) =>
      SettingsStateRepository(
        useDarkMode: useDarkMode ?? this.useDarkMode,
        useAnimatedBackgrounds:
            useAnimatedBackgrounds ?? this.useAnimatedBackgrounds,
        tempUnits: tempUnits ?? this.tempUnits,
        windSpeedUnits: windSpeedUnits ?? this.windSpeedUnits,
        airPressureUnits: airPressureUnits ?? this.airPressureUnits,
      );

  @override
  bool get isNotValid => !isValid;

  @override
  bool get isValid =>
      useDarkMode != null &&
      useAnimatedBackgrounds != null &&
      tempUnits != null &&
      windSpeedUnits != null &&
      airPressureUnits != null;

  @override
  Map<String, dynamic> toJson() => {
        'airPressureUnits': this.airPressureUnits.index ?? null,
        'tempUnits': this.tempUnits.index ?? null,
        'windSpeedUnits': windSpeedUnits ?? null,
        'useDarkMode': useDarkMode ?? null,
        'useAnimatedBackgrounds': useAnimatedBackgrounds ?? null,
      };

  @override
  SettingsStateRepository.fromJson(json)
      : airPressureUnits =
            AirPressureUnits.values.elementAt(json['airPressureUnits']) ??
                AirPressureUnits.Kpa,
        tempUnits =
            TempUnits.values.elementAt(json['tempUnits']) ?? TempUnits.C,
        windSpeedUnits =
            WindSpeedUnits.values.elementAt(json['windSpeedUnits']) ??
                WindSpeedUnits.Kph,
        useDarkMode = json['useDarkMode'] ?? false,
        useAnimatedBackgrounds = json['useAnimatedBackgrounds'] ?? true;
}
