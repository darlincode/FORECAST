import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TemperaturePanel extends StatelessWidget {
  const TemperaturePanel({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return StoreConnector<GlobalAppState, WidgetViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            WidgetViewModel.create(store),
        builder: (BuildContext context, WidgetViewModel _viewModel) {
          return Container(
              width: _sw - 96,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: _viewModel.panelColor),
              child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
                  child: Column(children: [
                    Text(_viewModel.cityName,
                        style: TextStyle(
                            color: _viewModel.textColor, fontSize: 32)),
                    Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: CachedNetworkImage(
                            imageUrl: 'http:${_viewModel.conditionsIconUrl}')),
                    Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Row(mainAxisSize: MainAxisSize.min, children: [
                          Text('${_viewModel.currentTemp.round()}',
                              style: temperatureTextStyle.copyWith(
                                  color: _viewModel.textColor)),
                          Text(' ${_viewModel.tempUnits}',
                              style: unitsTextStyle.copyWith(
                                  color: _viewModel.textColor)),
                        ])),
                    Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Text(
                            tr('conditions.${_viewModel.conditionsString}'),
                            style: TextStyle(
                                fontSize: 22,
                                color: _viewModel.textColor,
                                overflow: TextOverflow.ellipsis))),
                    Padding(
                        padding: const EdgeInsets.only(top: 16.0),
                        child: Text(
                            '${tr('feels_like')} ${_viewModel.currentRealfeel.round()} ${_viewModel.tempUnits}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: _viewModel.textColor)))
                  ])));
        });
  }
}
