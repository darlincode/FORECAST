import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/state.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleLoadLocalDataRequest() {
  return TypedMiddleware<GlobalAppState, LoadLocalDataAction>(
      (store, action, next) {
    bool foundData = false;

    try {
      // TODO: load to local data here
      if (foundData) {
        /// we found data!  load that shiz.
      } else {
        /// No local data found.  Assign default locationIndex and kick off
        /// grab coords & weatherData pipeline
        store.dispatch(SetActiveLocationIndexAction(index: 0));
        store.dispatch(GrabCurrentCoordsAction());
      }
    } catch (e) {
      // something went wrong loading data
      // kick off grab coords & weatherData pipeline
      store.dispatch(SetActiveLocationIndexAction(index: 0));
      store.dispatch(GrabCurrentCoordsAction());
    }
    // if (foundData) {
    //   /// we found data!  load that shiz.
    // } else {
    //   /// no data found.  Assign default locationIndex and kick off
    //   /// grab coords & weatherData pipeline
    //   store.dispatch(SetActiveLocationIndexAction(index: 0));
    //   store.dispatch(GrabCurrentCoordsAction());
    // }
  });
}

Middleware<GlobalAppState> handleSaveLocalDataRequest() {
  return TypedMiddleware<GlobalAppState, SaveLocalDataAction>(
      (store, action, next) {
    //
  });
}
