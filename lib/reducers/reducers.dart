import 'package:fancy_weather/state.dart';

GlobalAppState globalAppStateReducer(GlobalAppState state, action) {
  return GlobalAppState(
    connectionStatus: connectionStatusReducer(state.connectionStatus, action),
    loadingStatus: loadingStatusReducer(state.loadingStatus, action),
    userSettings: userSettingsReducer(state.userSettings, action),
    currentLocInfo: currentLocationReducer(state.currentLocInfo, action),
    locations: locationListReducer(state.locations, action),
    activeWeatherAlerts:
        activeWeatherAlertsReducer(state.activeWeatherAlerts, action),
        weatherData: weatherDataReduer(state.weatherData, action),
  );
}
