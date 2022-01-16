export 'local_io_actions.dart';
export 'location_list_actions.dart';
export 'user_settings_actions.dart';
export 'weather_list_actions.dart';

import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// Change loading status
@immutable
class SetLoadingStatusAction {
  final LoadingStatus loadingStatus;
  SetLoadingStatusAction(this.loadingStatus);

  @override
  String toString() {
    return 'SetLoadingStatusAction{loadingStatus: $loadingStatus}';
  }
}

/// Reducer used to update the weatherData
@immutable
class UpdateWeatherDataReducer {
  final List<WeatherStateRepository> weatherData;
  UpdateWeatherDataReducer(this.weatherData);

  @override
  String toString() {
    return 'UpdateWeatherDataReducer{weatherData: $weatherData}';
  }
}
