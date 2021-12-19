import 'package:fancy_weather/state.dart';

GlobalAppState globalAppStateReducer(GlobalAppState state, action) {
  return GlobalAppState(
    connectionStatus: connectionStatusReducer(state.connectionStatus, action),
    loadingStatus: loadingStatusReducer(state.loadingStatus, action),
    userSettings: userSettingsReducer(state.userSettings, action),
    currentLocationInfo:
        currentLocationReducer(state.currentLocationInfo, action),
    locations: locationListReducer(state.locations, action),
    currentConditions:
        currentConditionsReducer(state.currentConditions, action),
    hourlyForecast: hourlyForecastReducer(state.hourlyForecast, action),
    dailyForecast: dailyForecastReducer(state.dailyForecast, action),
    astrologicalData: astrologicalDataReducer(state.astrologicalData, action),
    activeWeatherAlerts:
        activeWeatherAlertsReducer(state.activeWeatherAlerts, action),
  );
}
