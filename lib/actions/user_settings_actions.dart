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

/// Reducer for animated backgrounds
@immutable
class SetToggleAnimatedBackgroundsAction {
  final bool useAnimatedBackgrounds;
  SetToggleAnimatedBackgroundsAction(this.useAnimatedBackgrounds);
}

/// Toggle dark theme
@immutable
class ToggleDarkModeAction {}

/// Reducer for dark theme
@immutable
class SetToggleDarkModeAction {
  final bool useDarkMode;
  SetToggleDarkModeAction(this.useDarkMode);

  @override
  String toString() {
    return 'SetToggleDarkModeAction{useDarkMode: $useDarkMode}';
  }
}


/// Change temperature units
@immutable
class SetTempUnitsAction {
  final TempUnits tempUnits;
  SetTempUnitsAction(this.tempUnits);

  @override
  String toString() {
    return 'SetTempUnitsAction{tempUnits: $tempUnits}';
  }
}


// Change wind speed units
@immutable
class SetWindSpeedUnitsAction {
  final WindSpeedUnits windSpeedUnits;
  SetWindSpeedUnitsAction(this.windSpeedUnits);

  @override
  String toString() {
    return 'SetWindSpeedUnitsAction{windSpeedUnits: $windSpeedUnits}';
  }
}


/// Change air pressure units
@immutable
class SetAirPressureUnitsAction {
  final AirPressureUnits airPressureUnits;
  SetAirPressureUnitsAction(this.airPressureUnits);

  @override
  String toString() {
    return 'SetAirPressureUnitsAction{airPressureUnits: $airPressureUnits}';
  }
}
