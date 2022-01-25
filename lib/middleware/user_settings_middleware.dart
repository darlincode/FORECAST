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
