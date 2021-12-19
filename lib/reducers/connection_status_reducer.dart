import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';

Reducer<ConnectionStatus> connectionStatusReducer =
    TypedReducer<ConnectionStatus, SetConnectionStatusAction>(
        _setConnectionStatusReducer);

ConnectionStatus _setConnectionStatusReducer(
    ConnectionStatus connectionStatus, action) {
  print('DEBUG: _setConnectionStatusReducer fired');

  return action.connectionStatus;
}
