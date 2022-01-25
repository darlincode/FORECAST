import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/api/api_utils.dart';
import 'package:fancy_weather/api/apis.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:redux/redux.dart';

Middleware<GlobalAppState> handleWeatherDataRequest(WeatherAPI weatherApi) {
  return (Store<GlobalAppState> store, action, NextDispatcher next) async {
    // set the app state as loading
    store.dispatch(SetLoadingStatusAction(LoadingStatus.Loading));

    FetchWeatherDataAction _action = action;
    APIResponse _response = await weatherApi.getWeatherData(
      lat: _action.latitude,
      long: _action.longitude,
    );

    // process the response
    if (_response.isOk) {
      // we tell the UI the call was a success
      store.dispatch(SetLoadingStatusAction(LoadingStatus.Success));

      WeatherStateRepository _apiResult = _response.result;

      WeatherStateRepository _weatherData =
          WeatherStateRepository.createEmpty().copyWith(
        location: APILocation.createEmpty().copyWith(
          name: _apiResult.location.name,
          country: _apiResult.location.country,
          lat: _apiResult.location.lat,
          long: _apiResult.location.long,
          localtime: _apiResult.location.localtime,
          localtime_epoch: _apiResult.location.localtime_epoch,
          region: _apiResult.location.region,
          tz_id: _apiResult.location.tz_id,
        ),
        currentConditions: APICurrentConditions.createEmpty().copyWith(
          condition: APICondition.createEmpty().copyWith(
            code: _apiResult.currentConditions.condition.code,
            icon: _apiResult.currentConditions.condition.icon,
            text: _apiResult.currentConditions.condition.text,
          ),
          temp_c: _apiResult.currentConditions.temp_c,
          temp_f: _apiResult.currentConditions.temp_f,
          feelslike_c: _apiResult.currentConditions.feelslike_c,
          feelslike_f: _apiResult.currentConditions.feelslike_f,
          air_quality: APIAQI.createEmpty().copyWith(
                co: _apiResult.currentConditions.air_quality.co,
                no2: _apiResult.currentConditions.air_quality.no2,
                so2: _apiResult.currentConditions.air_quality.so2,
                o3: _apiResult.currentConditions.air_quality.o3,
                pm2_5: _apiResult.currentConditions.air_quality.pm2_5,
                pm10: _apiResult.currentConditions.air_quality.pm10,
                us_epa_index:
                    _apiResult.currentConditions.air_quality.us_epa_index,
                gb_defra_index:
                    _apiResult.currentConditions.air_quality.gb_defra_index,
              ),
          humidity: _apiResult.currentConditions.humidity,
          is_day: _apiResult.currentConditions.is_day,
          last_updated: _apiResult.currentConditions.last_updated,
          last_updated_epoch: _apiResult.currentConditions.last_updated_epoch,
          pressure_in: _apiResult.currentConditions.pressure_in,
          pressure_mb: _apiResult.currentConditions.pressure_mb,
          uv: _apiResult.currentConditions.uv,
          wind_degree: _apiResult.currentConditions.wind_degree,
          wind_dir: _apiResult.currentConditions.wind_dir,
          wind_kph: _apiResult.currentConditions.wind_kph,
          wind_mph: _apiResult.currentConditions.wind_mph,
        ),
        forecast: _apiResult.forecast,
        weatherAlerts: []..addAll(_apiResult.weatherAlerts),
      );

      store.dispatch(ReplaceWeatherDataInListAction(
        index: _action.index,
        weatherData: _weatherData,
      ));
    } else {
      print('There was a problem fetching weather data ${_response.message}');
      store.dispatch(SetLoadingStatusAction(LoadingStatus.Idle));
    }
  };
}
