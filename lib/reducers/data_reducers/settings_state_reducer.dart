import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';

Reducer<SettingsStateRepository> settingsStateReducer =
    TypedReducer<SettingsStateRepository, SetCurrentLocationAction>(
        _setUserSettingsReducer);

SettingsStateRepository _setUserSettingsReducer(
    SettingsStateRepository settingsStateRepository, action) {
  print('DEBUG: _setUserSettingsReducer fired');

  return action.settingsStateRepository;
}
