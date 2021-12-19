import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class HomeScreenViewModel {
  final bool isLoading;

  HomeScreenViewModel({
    @required this.isLoading,
  });

  factory HomeScreenViewModel.create(Store<GlobalAppState> store) {
    // add methods here
    // ie - grabWeatherData

    return HomeScreenViewModel(
      isLoading: store.state.loadingStatus == LoadingStatus.loading,
    );
  }
}
