import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/state.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleToggleAnimatedBackgroundsRequest() {
  return TypedMiddleware<GlobalAppState, ToggleAnimatedBackgroundsAction>(
      (store, action, next) {
    store.dispatch(UpdateUserSettingsAction(store.state.userSettings.copyWith(
        useAnimatedBackgrounds:
            !store.state.userSettings.useAnimatedBackgrounds)));
  });
}

Middleware<GlobalAppState> handleToggleDarkModeRequest() {
  return TypedMiddleware<GlobalAppState, ToggleDarkModeAction>(
      (store, action, next) {
    store.dispatch(UpdateUserSettingsAction(store.state.userSettings
        .copyWith(useDarkMode: !store.state.userSettings.useDarkMode)));
  });
}

Middleware<GlobalAppState> handleChangeTempUnitRequest() {
  return TypedMiddleware<GlobalAppState, ChangeTempUnitsAction>(
      (store, action, next) {
    store.dispatch(UpdateUserSettingsAction(
        store.state.userSettings.copyWith(tempUnits: action.tempUnits)));
  });
}

Middleware<GlobalAppState> handleChangeWindSpeedUnitsRequest() {
  return TypedMiddleware<GlobalAppState, ChangeWindSpeedUnitsAction>(
      (store, action, next) {
    store.dispatch(UpdateUserSettingsAction(store.state.userSettings
        .copyWith(windSpeedUnits: action.windSpeedUnits)));
  });
}

Middleware<GlobalAppState> handleChangeAirPressureUnitsRequest() {
  return TypedMiddleware<GlobalAppState, ChangeAirPressureUnitsAction>(
      (store, action, next) {
    store.dispatch(UpdateUserSettingsAction(store.state.userSettings
        .copyWith(airPressureUnits: action.airPressureUnits)));
    //
  });
}

Middleware<GlobalAppState> handleChangeAQIUnitsRequest() {
  return TypedMiddleware<GlobalAppState, ChangeAQIUnitsAction>(
      (store, action, next) {
    store.dispatch(UpdateUserSettingsAction(
        store.state.userSettings.copyWith(aqiUnits: action.aqiUnits)));
  });
}
