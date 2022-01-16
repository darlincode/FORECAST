import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/screens/home_screen/home_screen_view_model.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TemperaturePanel extends StatelessWidget {
  const TemperaturePanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return StoreConnector<GlobalAppState, HomeScreenViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            HomeScreenViewModel.create(store),
        builder: (BuildContext context, HomeScreenViewModel _viewModel) {
          return Container(
            width: _sw - 96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: _viewModel.useDarkMode
                  ? bgColorDarkMode.withOpacity(0.45)
                  : bgColorLightMode.withOpacity(0.45),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Column(
                children: [
                  Text(
                    _viewModel.cityName,
                    // _viewModel.getCityName(_viewModel.activeLocationIndex),
                    style: TextStyle(
                      color: _viewModel.useDarkMode
                          ? textColorDarkMode
                          : textColorLightMode,
                      fontSize: 32,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CachedNetworkImage(
                        imageUrl: 'http:${_viewModel.conditionsIconUrl}'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '${_viewModel.currentTemp.round()}',
                          style: temperatureTextStyle.copyWith(
                            color: _viewModel.useDarkMode
                                ? textColorDarkMode
                                : textColorLightMode,
                          ),
                        ),
                        Text(
                          ' ${_viewModel.tempUnits}',
                          style: unitsTextStyle.copyWith(
                            color: _viewModel.useDarkMode
                                ? textColorDarkMode
                                : textColorLightMode,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text(
                      _viewModel.conditionsString,
                      style: TextStyle(
                        fontSize: 22,
                        color: _viewModel.useDarkMode
                            ? textColorDarkMode
                            : textColorLightMode,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      '${tr('feels_like')} ${_viewModel.currentRealfeel.round()} ${_viewModel.tempUnits}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: _viewModel.useDarkMode
                            ? textColorDarkMode
                            : textColorLightMode,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
