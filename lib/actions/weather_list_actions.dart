import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// Update the current weatherDataList state
@immutable
class UpdateWeatherDataListAction {
  final List<WeatherStateRepository> weatherDataList;
  UpdateWeatherDataListAction(this.weatherDataList);

  @override
  String toString() {
    return 'UpdateWeatherDataListAction{weatherDataList: $weatherDataList}';
  }
}

/// Fetch fresh weather data from API
@immutable
class FetchWeatherDataAction {
  final int index;
  final double latitude;
  final double longitude;
  FetchWeatherDataAction({this.index, this.latitude, this.longitude});

  @override
  String toString() {
    return 'FetchWeatherDataAction{location: $index}';
  }
}

/// Updates the data of an entry in weatherDataList
@immutable
class ReplaceWeatherDataInListAction {
  final int index;
  final WeatherStateRepository weatherData;
  ReplaceWeatherDataInListAction({this.index, this.weatherData});

  @override
  String toString() {
    return 'ReplaceWeatherDataInListAction{index: $index,weatherData: $weatherData';
  }
}

/// Add new weatherData to the weatherDataList
@immutable
class AddWeatherDataToListAction {
  final WeatherStateRepository weatherData;
  AddWeatherDataToListAction(this.weatherData);

  @override
  String toString() {
    return 'ReplaceWeatherDataInListAction{weatherData: $weatherData';
  }
}

/// Set the index of the active entry in the weatherDataList
@immutable
class SetActiveWeatherDataIndexAction {
  final int index;
  SetActiveWeatherDataIndexAction({this.index});

  @override
  String toString() {
    return 'SetActiveWeatherDataIndexAction{index: $index}';
  }
}

/// Clear all entries in weatherDataList (except [0])
@immutable
class ClearWeatherDataListAction {}

/// Delete a weatherData entry from weatherDataList using passed id
@immutable
class DeleteWeatherDataFromListAction {
  final String id;
  DeleteWeatherDataFromListAction(this.id);

  @override
  String toString() {
    return 'DeleteWeatherDataFromListAction{id: $id}';
  }
}
