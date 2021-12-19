import 'dart:math';

import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/api/api_utils.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/models/connection_status_model.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleWeatherDataRequest(WeatherAPI weatherApi) {
  return (Store<GlobalAppState> store, action, NextDispatcher next) async {
    // set the app state as loading
    store.dispatch(SetLoadingStatusAction(LoadingStatus.Loading));

    FetchWeatherDataAction _action = action;

    // Get the connection status to check if online or not
    // ConnectionStatus connectionStatus = store.state.connectionStatus;
    bool online = store.state.connectionStatus == ConnectionStatus.Online;

    if (online) {
      APIResponse _response = await weatherApi.getWeatherData(
        lat: _action.location.latitude,
        long: _action.location.longitude,
      );

      // process the response
      if (_response.isOk) {
        // we tell the UI the call was a success
        store.dispatch(SetLoadingStatusAction(LoadingStatus.Success));

        // TODO: Remove debugging messages
        print(
            '_response.result.location[\'name\'] = ${_response.result.location['name']}');

        WeatherStateRepository _processedData = WeatherStateRepository(
            // TODO: Add missing fields
            );

        // send the data to the reducer
        // store.dispatch(SetWeatherStateAction(_processedData));
        // TODO: DELETE THE FOLLOWING TESTING LINES ========================
        var _rng = new Random();
        bool _isNegativeThisTime = _rng.nextInt(2) > 0;
        double _nextTemp = _isNegativeThisTime
            ? (_rng.nextInt(25) * -1).toDouble()
            : _rng.nextInt(25).toDouble();

        store.dispatch(
          SetWeatherStateAction(
            WeatherStateRepository.createEmpty().copyWith(tempC: _nextTemp),
          ),
        );
        // =================================================================
      } else {
        print('There was a problem fetching weather data ${_response.message}');
        store.dispatch(SetLoadingStatusAction(LoadingStatus.Success));
        store.dispatch(
            SetWeatherStateAction(WeatherStateRepository.createEmpty()));
      }
    } else {
      // we are offline
    }
  };
}
