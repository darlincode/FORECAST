// @dart=2.9

import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/models/weather_alert_model.dart';

class GlobalAppState {
  final CurrentWeatherStateRepository currentConditions;
  final AstrologicalStateRepository astrologicalData;
  final DailyForecastStateRepository dailyForecast;
  final HourlyForecastStateRepository hourlyForecast;
  final List<WeatherAlert> activeWeatherAlerts;
  final SettingsStateRepository userSettings;
  final List<Location> locations;
  final LoadingStatus loadingStatus;

  const GlobalAppState({
    this.locations,
    this.currentConditions,
    this.astrologicalData,
    this.dailyForecast,
    this.hourlyForecast,
    this.activeWeatherAlerts,
    this.loadingStatus,
    this.userSettings,
  });

  GlobalAppState.initialState()
      : currentConditions = CurrentWeatherStateRepository.createEmpty(),
        astrologicalData = AstrologicalStateRepository.createEmpty(),
        dailyForecast = DailyForecastStateRepository.createEmpty(),
        hourlyForecast = HourlyForecastStateRepository.createEmpty(),
        activeWeatherAlerts = List.unmodifiable([]),
        userSettings = SettingsStateRepository.createEmpty(),
        locations = List.unmodifiable([]),
        loadingStatus = LoadingStatus.idle;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GlobalAppState &&
          other.currentConditions == currentConditions &&
          other.astrologicalData == astrologicalData &&
          other.dailyForecast == dailyForecast &&
          other.hourlyForecast == hourlyForecast &&
          other.activeWeatherAlerts == activeWeatherAlerts &&
          other.userSettings == userSettings &&
          other.locations == locations &&
          other.loadingStatus == loadingStatus;

  @override
  int get hashCode =>
      currentConditions.hashCode ^
      astrologicalData.hashCode ^
      dailyForecast.hashCode ^
      hourlyForecast.hashCode ^
      activeWeatherAlerts.hashCode ^
      userSettings.hashCode ^
      locations.hashCode ^
      loadingStatus.hashCode;

  GlobalAppState copyWith(
    CurrentWeatherStateRepository currentConditions,
    AstrologicalStateRepository astrologicalData,
    DailyForecastStateRepository dailyForecast,
    HourlyForecastStateRepository hourlyForecast,
    List<WeatherAlert> activeWeatherAlerts,
    SettingsStateRepository userSettings,
    List<Location> locations,
    LoadingStatus loadingStatus,
  ) =>
      GlobalAppState(
        currentConditions: currentConditions ?? this.currentConditions,
        astrologicalData: astrologicalData ?? this.astrologicalData,
        dailyForecast: dailyForecast ?? this.dailyForecast,
        hourlyForecast: hourlyForecast ?? this.hourlyForecast,
        activeWeatherAlerts: activeWeatherAlerts ?? this.activeWeatherAlerts,
        userSettings: userSettings ?? this.userSettings,
        locations: locations ?? this.locations,
        loadingStatus: loadingStatus ?? this.loadingStatus,
      );
}
