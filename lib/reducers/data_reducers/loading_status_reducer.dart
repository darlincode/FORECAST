import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:redux/redux.dart';

Reducer<LoadingStatus> loadingStatusReducer =
    TypedReducer<LoadingStatus, SetLoadingStatusAction>(
        _setLoadingStatusReducer);

LoadingStatus _setLoadingStatusReducer(
    LoadingStatus status, SetLoadingStatusAction action) {
  print('DEBUG: LoadingStatus = ${action.loadingStatus}');

  return action.loadingStatus;
}
