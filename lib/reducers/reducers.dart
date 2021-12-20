import 'package:fancy_weather/reducers/data_reducers/data_reducers.dart';
import 'package:fancy_weather/state.dart';

GlobalAppState globalAppStateReducer(GlobalAppState state, action) {
  return GlobalAppState(
    connectionStatus: connectionStatusReducer(state.connectionStatus, action),
    loadingStatus: loadingStatusReducer(state.loadingStatus, action),
    locations: locationListReducer(state.locations, action),
    userSettings: settingsStateReducer(state.userSettings, action),
    currentLocInfo: currentLocationReducer(state.currentLocInfo, action),
    weatherData: weatherDataReducer(state.weatherData, action),
  );


  
}
