import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/reducers/data_reducers/data_reducers.dart';
import 'package:fancy_weather/state.dart';

GlobalAppState globalAppStateReducer(GlobalAppState state, action) =>
    (action is SetGlobalStateAction)
        ? setGlobalStateReducer(state, action)
        : state.copyWith(
            activeLocationIndex:
                activeLocationReducer(state.activeLocationIndex, action),
            loadingStatus: loadingStatusReducer(state.loadingStatus, action),
            locationList: locationListReducer(state.locationList, action),
            weatherDataList:
                weatherDataListReducer(state.weatherDataList, action),
            userSettings: settingsStateReducer(state.userSettings, action),
          );

setGlobalStateReducer(GlobalAppState state, SetGlobalStateAction action) {
  return action.state;
}
