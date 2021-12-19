import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class ToggleAnimatedBackgroundsAction {
  ToggleAnimatedBackgroundsAction();
}

@immutable
class ToggleDarkModeAction {
  ToggleDarkModeAction();
}

@immutable
class SetTempUnitsAction {
  final TempUnits tempUnits;
  SetTempUnitsAction(this.tempUnits);
}

@immutable
class SetWindSpeedUnitsAction {
  final WindSpeedUnits windSpeedUnits;
  SetWindSpeedUnitsAction(this.windSpeedUnits);
}

@immutable
class SetAirPressureUnitsAction {
  final AirPressureUnits airPressureUnits;
  SetAirPressureUnitsAction(this.airPressureUnits);
}
