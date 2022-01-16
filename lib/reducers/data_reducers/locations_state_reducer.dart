import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';

Reducer<int> activeLocationReducer =
    TypedReducer<int, SetActiveLocationIndexAction>(_setActiveLocationReducer);

int _setActiveLocationReducer(int index, SetActiveLocationIndexAction action) {
  print('DEBUG: _setActiveLocationReducer fired');

  return action.index;
}

List<SimpleLocation> locationListReducer(List<SimpleLocation> state, action) {
  if (action is AddCoordsToLocationListAction) {
    return List.unmodifiable(
      List.from(state)
        ..add(
          SimpleLocation(
            id: action.location.id,
            latitude: action.location.latitude,
            longitude: action.location.longitude,
          ),
        ),
    );
  }

  if (action is UpdateLocationListAction) {
    return action.locations;
  }

  /// Remove an entry from the list of available locations
  if (action is DeleteLocationFromListAction) {
    return List.unmodifiable(
      List.from(state)..removeWhere((element) => element.id == action.id),
    );
  }

  /// Remove all entries from the list of available locations,
  /// except user's current location
  if (action is ClearLocationListAction) {
    return List.unmodifiable([]..add(List.from(state)[0]));
  }
}
