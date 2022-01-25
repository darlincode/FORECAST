import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';
import 'package:uuid/uuid.dart';

Reducer<int> activeLocationReducer =
    TypedReducer<int, SetActiveLocationIndexAction>(_setActiveLocationReducer);

int _setActiveLocationReducer(int state, SetActiveLocationIndexAction action) {
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

  if (action is ReplaceCoordsInLocationListAction) {
    SimpleLocation _newLoc = SimpleLocation(
        id: Uuid().v4(),
        latitude: action.latitude,
        longitude: action.longitude);
    if (List.from(state).isEmpty) {
      return List.unmodifiable([_newLoc]);
      // ..removeAt(action.index)
      // ..insert(action.index, _newLoc);
    } else {
      return List.from(state)
        ..removeAt(action.index)
        ..insert(action.index, _newLoc);
    }
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
