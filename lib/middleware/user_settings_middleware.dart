import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/state.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleToggleAnimatedBackgroundsRequest() {
  return TypedMiddleware<GlobalAppState, ToggleAnimatedBackgroundsAction>(
      (store, action, next) {
    store.dispatch(
      UpdateUserSettingsAction(
        store.state.userSettings.copyWith(
          useAnimatedBackgrounds:
              !store.state.userSettings.useAnimatedBackgrounds,
        ),
      ),
    );
  });
}

Middleware<GlobalAppState> handleToggleDarkModeRequest() {
  return TypedMiddleware<GlobalAppState, ToggleDarkModeAction>(
      (Store<GlobalAppState> store, ToggleDarkModeAction action,
          NextDispatcher next) {
    store.dispatch(
      UpdateUserSettingsAction(
        store.state.userSettings.copyWith(
          useDarkMode: !store.state.userSettings.useDarkMode,
        ),
      ),
    );
  });
}

Middleware<GlobalAppState> handleToggleAddLocationModeRequest() {
  return TypedMiddleware<GlobalAppState, ToggleAddLocationModeAction>(
      (Store<GlobalAppState> store, ToggleAddLocationModeAction action,
          NextDispatcher next) {
    store.dispatch(
      UpdateUserSettingsAction(
        store.state.userSettings.copyWith(
          isAddLocationMode: !store.state.userSettings.isAddLocationMode,
        ),
      ),
    );
  });
}

Middleware<GlobalAppState> handleChangeTempUnitRequest() {
  return TypedMiddleware<GlobalAppState, ChangeTempUnitsAction>(
      (Store<GlobalAppState> store, ChangeTempUnitsAction action,
          NextDispatcher next) {
    store.dispatch(UpdateUserSettingsAction(
        store.state.userSettings.copyWith(tempUnits: action.tempUnits)));
  });
}

Middleware<GlobalAppState> handleChangeWindSpeedUnitsRequest() {
  return TypedMiddleware<GlobalAppState, ChangeWindSpeedUnitsAction>(
      (Store<GlobalAppState> store, ChangeWindSpeedUnitsAction action,
          NextDispatcher next) {
    store.dispatch(UpdateUserSettingsAction(store.state.userSettings
        .copyWith(windSpeedUnits: action.windSpeedUnits)));
  });
}

Middleware<GlobalAppState> handleChangeAirPressureUnitsRequest() {
  return TypedMiddleware<GlobalAppState, ChangeAirPressureUnitsAction>(
      (Store<GlobalAppState> store, ChangeAirPressureUnitsAction action,
          NextDispatcher next) {
    store.dispatch(UpdateUserSettingsAction(store.state.userSettings
        .copyWith(airPressureUnits: action.airPressureUnits)));
    //
  });
}
