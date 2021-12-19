// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// User settings repository
class SettingsStateRepository {
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
        tempUnits: TempUnits.c,
        windSpeedUnits: WindSpeedUnits.kph,
        airPressureUnits: AirPressureUnits.kpa,
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

  // TODO: Add toJson and fromJson methods
}
