import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// Reducer for changes in the user settings
@immutable
class UpdateUserSettingsAction {
  final SettingsStateRepository userSettings;
  UpdateUserSettingsAction(this.userSettings);

  @override
  String toString() {
    return 'UpdateUserSettingsAction{userSettings: $userSettings}';
  }
}

/// Toggle animated backgrounds
@immutable
class ToggleAnimatedBackgroundsAction {}

/// Toggle dark theme
@immutable
class ToggleDarkModeAction {}

/// Change temperature units
@immutable
class ChangeTempUnitsAction {
  final TempUnits tempUnits;
  ChangeTempUnitsAction(this.tempUnits);

  @override
  String toString() {
    return 'ChangeTempUnitsAction{tempUnits: $tempUnits}';
  }
}

// Change wind speed units
@immutable
class ChangeWindSpeedUnitsAction {
  final WindSpeedUnits windSpeedUnits;
  ChangeWindSpeedUnitsAction(this.windSpeedUnits);

  @override
  String toString() {
    return 'ChangeWindSpeedUnitsAction{windSpeedUnits: $windSpeedUnits}';
  }
}

/// Change air pressure units
@immutable
class ChangeAirPressureUnitsAction {
  final AirPressureUnits airPressureUnits;
  ChangeAirPressureUnitsAction(this.airPressureUnits);

  @override
  String toString() {
    return 'ChangeAirPressureUnitsAction{airPressureUnits: $airPressureUnits}';
  }
}
