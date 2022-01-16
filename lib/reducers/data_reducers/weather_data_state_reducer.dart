import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
// import 'package:redux/redux.dart';

// Reducer<int> activeWeatherDataReducer =
//     TypedReducer<int, SetActiveWeatherDataIndexAction>(
//         _setActiveWeatherIndexReducer);

// int _setActiveWeatherIndexReducer(
//     int index, SetActiveWeatherDataIndexAction action) {
//   print('DEBUG: _setActiveWeatherIndexReducer fired');

//   return action.index;
// }

List<WeatherStateRepository> weatherDataListReducer(
    List<WeatherStateRepository> state, action) {
  if (action is AddWeatherDataToListAction) {
    return List.unmodifiable(
      List.from(state)
        ..add(
          WeatherStateRepository(
            currentConditions: action.weatherData.currentConditions,
            forecast: action.weatherData.forecast,
            location: action.weatherData.location,
            weatherAlerts: action.weatherData.weatherAlerts,
          ),
        ),
    );
  }

  if (action is UpdateWeatherDataListAction) {
    return action.weatherDataList;
  }

  /// Remove an entry from the list of available locations
  if (action is DeleteWeatherDataFromListAction) {
    return List.unmodifiable(
      List.from(state)..removeWhere((element) => element.id == action.id),
    );
  }

  /// Remove all entries from the list of available locations,
  /// except user's current location
  if (action is ClearWeatherDataListAction) {
    return List.unmodifiable([]..add(List.from(state)[0]));
  }

  return null;
}
