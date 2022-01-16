import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';

/// Reducer for updating all user settings
Reducer<SettingsStateRepository> settingsStateReducer =
    TypedReducer<SettingsStateRepository, UpdateUserSettingsAction>(
        _setUserSettingsReducer);

SettingsStateRepository _setUserSettingsReducer(
    SettingsStateRepository settingsState, UpdateUserSettingsAction action) {
  print('DEBUG: _setUserSettingsReducer fired');

  return settingsState.copyWith(
    airPressureUnits: action.userSettings.airPressureUnits,
    locationList: action.userSettings.locationList,
    tempUnits: action.userSettings.tempUnits,
    useAnimatedBackgrounds: action.userSettings.useAnimatedBackgrounds,
    useDarkMode: action.userSettings.useDarkMode,
    windSpeedUnits: action.userSettings.windSpeedUnits,
  );
}

/// Reducer for toggling animated background
Reducer<SettingsStateRepository> toggleBackgroundReducer =
    TypedReducer<SettingsStateRepository, SetToggleAnimatedBackgroundsAction>(
        _setUseAnimatedBackgroundReducer);

SettingsStateRepository _setUseAnimatedBackgroundReducer(
    SettingsStateRepository settingsState,
    SetToggleAnimatedBackgroundsAction action) {
  return settingsState.copyWith(
      useAnimatedBackgrounds: action.useAnimatedBackgrounds);
}

/// Reducer for toggling dark theme
Reducer<SettingsStateRepository> toggleDarkModeReducer =
    TypedReducer<SettingsStateRepository, SetToggleDarkModeAction>(
        _setToggleDarkModeReducerReducer);

SettingsStateRepository _setToggleDarkModeReducerReducer(
    SettingsStateRepository settingsState, SetToggleDarkModeAction action) {
  return settingsState.copyWith(useDarkMode: action.useDarkMode);

  // return action.useDarkMode;
}
