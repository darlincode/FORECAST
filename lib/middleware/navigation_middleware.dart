import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/state.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> buildHandleNavigateBodyAction() {
  return TypedMiddleware<GlobalAppState, NavigateBodyAction>(
      (Store<GlobalAppState> store, NavigateBodyAction action,
          NextDispatcher next) {
    next(action);
  });
}
