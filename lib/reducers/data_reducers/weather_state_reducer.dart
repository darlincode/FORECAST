import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';

Reducer<WeatherStateRepository> weatherDataReducer =
    TypedReducer<WeatherStateRepository, SetCurrentLocationAction>(
        _setWeatherStateReducer);

WeatherStateRepository _setWeatherStateReducer(
    WeatherStateRepository weatherStateRepository, action) {
  print('DEBUG: _setWeatherStateReducer fired');

  return action.weatherStateRepository;
}
