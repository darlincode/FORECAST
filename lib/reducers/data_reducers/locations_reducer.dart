import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';

List<Location> locationListReducer(List<Location> state, action) {
  if (action is AddLocationAction) {
    return []
      ..addAll(state)
      ..add(
        Location(
          latitude: action.location.latitude,
          longitude: action.location.longitude,
        ),
      );
  }

  if (action is RemoveLocationAction) {
    return List.unmodifiable(
      List.from(state)..removeWhere((element) => element.id == action.id),
    );
  }

  if (action is ClearLocationsAction) {
    return List.unmodifiable([]..add(List.from(state)[0]));
  }

  if (action is SetCurrentLocationAction) {
    return List.from(state)
      ..removeAt(0)
      ..insert(
          0,
          Location(
            latitude: action.location.latitude,
            longitude: action.location.longitude,
          ));
  }
}
