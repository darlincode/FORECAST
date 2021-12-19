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
    store.dispatch(SetLoadingStatusAction(LoadingStatus.loading));

    FetchWeatherDataAction _action = action;

    // Get the connection status to check if online or not
    // ConnectionStatus connectionStatus = store.state.connectionStatus;
    bool online = store.state.connectionStatus == ConnectionStatus.online;

    if (online) {
      APIResponse _response = await weatherApi.getWeatherData(
        lat: _action.lat,
        long: _action.long,
      );

      // process the response
      if (_response.isOk) {
        // we tell the UI the call was a success
        store.dispatch(SetLoadingStatusAction(LoadingStatus.success));

        // TODO: Remove debugging messages
        print(
            '_response.result.location[\'name\'] = ${_response.result.location['name']}');

        // send the data to the reducer
        store.dispatch(SetWeatherDataAction(_response.result));
      } else {
        print('There was a problem fetching weather data ${_response.message}');
        store.dispatch(SetLoadingStatusAction(LoadingStatus.success));
        store.dispatch(SetWeatherDataAction(WeatherData.initial()));
      }
    } else {
      // we are offline
    }
  };
}
