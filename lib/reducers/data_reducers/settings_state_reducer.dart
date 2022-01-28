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
    // isAddLocationMode: action.userSettings.isAddLocationMode,
  );
}
