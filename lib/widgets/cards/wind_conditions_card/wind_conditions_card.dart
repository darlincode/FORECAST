import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/cards/wind_conditions_card/wind_conditions_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WindConditionsCard extends StatelessWidget {
  const WindConditionsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, WindConditionsCardViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            WindConditionsCardViewModel.create(store),
        builder: (BuildContext context, WindConditionsCardViewModel viewModel) {
          final double _sw = MediaQuery.of(context).size.width;

          return Container(
              width: _sw - 64,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: viewModel.panelColor),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    Text(tr('cards.titles.wind-conditions'),
                        style: viewModel.cardHeaderTextStyle),
                    const SizedBox(height: 4),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildWindSpeedGauge(viewModel, _sw),
                          _buildWindCompass(viewModel, _sw)
                        ])
                  ])));
        });
  }

  Widget _buildWindCompass(WindConditionsCardViewModel viewModel, double _sw) {
    return SizedBox(
        width: (_sw / 2) - 48,
        height: 80,
        child: Stack(children: [
          SfRadialGauge(axes: [
            RadialAxis(
                axisLineStyle: AxisLineStyle(
                    thickness: 3, color: viewModel.useDarkMode ? grey : null),
                minimum: 0,
                maximum: 360,
                pointers: [
                  MarkerPointer(
                      color: viewModel.pointerColor,
                      elevation: 4,
                      markerType: MarkerType.triangle,
                      value: viewModel.currentWindDegrees.toDouble())
                ],
                showTicks: false,
                startAngle: 270,
                endAngle: 270,
                showLabels: false)
          ]),
          Center(
              child: Text(
                  tr('wind-dir.${viewModel.currentWindDegreesString.toLowerCase()}'),
                  style: viewModel.cardbodyTextStyle))
        ]));
  }

  Widget _buildWindSpeedGauge(
      WindConditionsCardViewModel viewModel, double _sw) {
    double _max = 0;

    switch (viewModel.windSpeedUnits) {
      case 'km/h':
      case 'mph':
        _max = 100;
        break;
      case 'kts':
        _max = 55;
        break;
      case 'm/s':
        _max = 30;
        break;
    }
    return SizedBox(
        width: (_sw / 2) - 48,
        height: 80,
        child: Stack(children: [
          SfRadialGauge(
            axes: [
              RadialAxis(
                  axisLineStyle: AxisLineStyle(
                      color: Colors.grey,
                      gradient: SweepGradient(
                        colors: <Color>[
                          Colors.green.withOpacity(0.6),
                          Colors.yellow.withOpacity(0.6),
                          Colors.red.withOpacity(0.6),
                        ],
                        stops: <double>[0.2, 0.4, 0.8],
                      ),
                      thickness: 5),
                  minimum: 0,
                  maximum: _max,
                  pointers: [
                    MarkerPointer(
                        color: viewModel.pointerColor,
                        value: viewModel.currentWindSpeed.toDouble())
                  ],
                  showTicks: false,
                  showLabels: false)
            ],
          ),
          Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                Text(viewModel.currentWindSpeed.toString(),
                    style: viewModel.cardbodyTextStyle),
                const SizedBox(width: 4),
                Text(viewModel.windSpeedUnits,
                    style: viewModel.cardbodyTextStyle)
              ]))
        ]));
  }
}
