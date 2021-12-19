import 'package:fancy_weather/models/models.dart';

class ToggleAnimatedBackgroundsAction {
  ToggleAnimatedBackgroundsAction();
}

class ToggleDarkModeAction {
  ToggleDarkModeAction();
}

class SetTempUnitsAction {
  final TempUnits tempUnits;
  SetTempUnitsAction(this.tempUnits);
}

class SetWindSpeedUnitsAction {
  final WindSpeedUnits windSpeedUnits;
  SetWindSpeedUnitsAction(this.windSpeedUnits);
}

class SetAirPressureUnitsAction {
  final AirPressureUnits airPressureUnits;
  SetAirPressureUnitsAction(this.airPressureUnits);
}
