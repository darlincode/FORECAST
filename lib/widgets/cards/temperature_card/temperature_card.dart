import 'package:cached_network_image/cached_network_image.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/cards/temperature_card/temperature_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class TemperatureCard extends StatelessWidget {
  const TemperatureCard({Key key}) : super(key: key);

  Widget _buildCurrentTempWidget(TemperatureCardViewModel viewModel) {
    return Text('${viewModel.currentTemp.round()}',
        style: temperatureTextStyle.copyWith(
            fontSize: viewModel.tempUnits == 'K' ? 96 : 128,
            color: viewModel.textColor));
  }

  Widget _buildTempUnitsWidget(TemperatureCardViewModel viewModel) {
    return Text(' ${viewModel.tempUnits}',
        style: unitsTextStyle.copyWith(color: viewModel.textColor));
  }

  Widget _buildConditionsStringWidget(TemperatureCardViewModel viewModel) {
    return Text(tr('conditions.${viewModel.conditionsString}'),
        style: TextStyle(
            fontSize: 22,
            color: viewModel.textColor,
            overflow: TextOverflow.ellipsis));
  }

  Widget _buildFeelsLikeStringWidget(TemperatureCardViewModel viewModel) {
    return Text(
        '${tr('feels_like')} ${viewModel.currentRealfeel.round()} ${viewModel.tempUnits}',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
            color: viewModel.textColor));
  }

  Widget _buildCityNameWidget(TemperatureCardViewModel viewModel) {
    return Text(viewModel.cityName,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: viewModel.textColor,
            fontSize: viewModel.cityName.length < 10 ? 48 : 32));
  }

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;

    return StoreConnector<GlobalAppState, TemperatureCardViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            TemperatureCardViewModel.create(store),
        builder: (BuildContext context, TemperatureCardViewModel viewModel) {
          return Container(
              width: _sw - 64,
              padding: const EdgeInsets.symmetric(vertical: 32),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: viewModel.panelColor),
              child: Column(children: [
                _buildCityNameWidget(viewModel),
                Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: CachedNetworkImage(
                        imageUrl: 'http:${viewModel.conditionsIconUrl}')),
                Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Row(mainAxisSize: MainAxisSize.min, children: [
                      _buildCurrentTempWidget(viewModel),
                      _buildTempUnitsWidget(viewModel),
                    ])),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: _buildConditionsStringWidget(viewModel),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: _buildFeelsLikeStringWidget(viewModel),
                ),
              ]));
        });
  }
}
