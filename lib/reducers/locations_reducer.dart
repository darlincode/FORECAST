import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';

List<Location> locationListReducer(List<Location> state, action) {
  if (action is AddLocationAction) {
    return []
      ..addAll(state)
      ..add(
        Location(
          cityName: action.location.cityName,
          isActive: action.location.isActive,
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
    return List.unmodifiable([]);
  }
}
