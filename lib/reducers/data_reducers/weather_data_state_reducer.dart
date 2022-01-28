import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';

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

  if (action is ReplaceWeatherDataInListAction) {
    if (List.from(state).isEmpty) {
      return List.unmodifiable([action.weatherData]);
    } else {
      return List.from(state)
        ..removeAt(action.index)
        ..insert(action.index, action.weatherData);
    }
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
