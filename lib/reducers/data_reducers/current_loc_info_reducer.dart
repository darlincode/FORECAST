import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';

Reducer<Location> currentLocationReducer =
    TypedReducer<Location, SetCurrentLocationAction>(
        _setCurrentLocationReducer);

Location _setCurrentLocationReducer(Location location, action) {
  print('DEBUG: _setCurrentLocationReducer fired');

  return action.location;
}
