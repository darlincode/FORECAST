import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return StoreConnector<GlobalAppState, WidgetViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            WidgetViewModel.create(store),
        builder: (BuildContext context, WidgetViewModel viewModel) {
          return Container(
              width: _sw - 64,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: viewModel.panelColor),
              child: Column(children: [
                Text(viewModel.cityName,
                    style: TextStyle(
                        color: viewModel.textColor,
                        fontSize: viewModel.cityName.length < 10 ? 48 : 32)),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CachedNetworkImage(
                        imageUrl: 'http:${viewModel.conditionsIconUrl}')),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      Text('${viewModel.currentTemp.round()}',
                          style: temperatureTextStyle.copyWith(
                              color: viewModel.textColor)),
                      Text(' ${viewModel.tempUnits}',
                          style: unitsTextStyle.copyWith(
                              color: viewModel.textColor)),
                    ])),
                Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text(tr('conditions.${viewModel.conditionsString}'),
                        style: TextStyle(
                            fontSize: 22,
                            color: viewModel.textColor,
                            overflow: TextOverflow.ellipsis))),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                        '${tr('feels_like')} ${viewModel.currentRealfeel.round()} ${viewModel.tempUnits}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: viewModel.textColor)))
              ]));
        });
  }
}
