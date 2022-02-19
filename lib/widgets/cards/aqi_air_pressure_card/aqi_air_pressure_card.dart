import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/cards/aqi_air_pressure_card/aqi_air_pressure_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

@immutable
class AQIAirPressureCard extends StatelessWidget {
  const AQIAirPressureCard({Key key}) : super(key: key);

  Widget _buildAqiSection(AQIAirPressureCardViewModel viewModel, double _sw) {
    return Container(
        width: _sw / 3,
        child: Column(children: [
          Text(tr('cards.titles.air-quality'),
              textAlign: TextAlign.center,
              style: viewModel.cardHeaderTextStyle),
          const SizedBox(height: 16),
          _buildAqiGauge(viewModel, _sw)
        ]));
  }

  Widget _buildAqiGauge(AQIAirPressureCardViewModel viewModel, double _sw) {
    return Container(
        width: (_sw / 2) - 48,
        height: 80,
        child: Column(children: [
          Text(viewModel.aqiString,
              style: viewModel.cardbodyTextStyle.copyWith(fontSize: 24)),
          const SizedBox(height: 8),
          SfLinearGauge(
              // showTicks: false,
              interval: viewModel.aqiMaxValue.toDouble(),
              axisLabelStyle:
                  viewModel.cardbodyTextStyle.copyWith(fontSize: 12),
              axisTrackStyle: LinearAxisTrackStyle(
                  borderWidth: (viewModel.useDarkMode ? 0 : 1),
                  color: Colors.grey,
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.6),
                    Colors.brown.withOpacity(0.6),
                  ])),
              minimum: 1,
              maximum: viewModel.aqiMaxValue.toDouble(),
              markerPointers: [
                LinearShapePointer(
                    value: viewModel.currentAQI.toDouble(),
                    color: viewModel.pointerColor,
                    height: 8,
                    width: 10)
              ]),
        ]));
  }

  Widget _buildAirPressureSection(
      AQIAirPressureCardViewModel viewModel, double _sw) {
    return Container(
        width: _sw / 3,
        child: Column(children: [
          Text(tr('cards.titles.air-pressure'),
              textAlign: TextAlign.center,
              style: viewModel.cardHeaderTextStyle),
          const SizedBox(height: 16),
          _buildAirPressureGauge(viewModel, _sw),
        ]));
  }

  Widget _buildAirPressureGauge(
      AQIAirPressureCardViewModel viewModel, double _sw) {
    return Container(
        width: (_sw / 2) - 48,
        height: 100,
        child: Stack(children: [
          SfRadialGauge(axes: [
            RadialAxis(
              axisLineStyle: AxisLineStyle(
                  cornerStyle: CornerStyle.bothCurve,
                  color: Colors.grey,
                  gradient: SweepGradient(colors: [
                    Colors.blue,
                    Colors.blueGrey,
                    Colors.grey,
                    Colors.yellow,
                    Colors.orange
                  ], stops: [
                    0,
                    0.25,
                    0.6,
                    0.8,
                    1
                  ]),
                  thickness: 5),
              minimum: viewModel.airPressureMin.toDouble(),
              maximum: viewModel.airPressureMax.toDouble(),
              pointers: [
                MarkerPointer(
                    color: viewModel.pointerColor,
                    elevation: 4,
                    markerType: MarkerType.invertedTriangle,
                    value: viewModel.currentAirPressure.toDouble())
              ],
              showTicks: false,
              showLabels: false,
            )
          ]),
          Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('${viewModel.currentAirPressure}',
                  style: viewModel.cardbodyTextStyle),
              const SizedBox(width: 4),
              Text(viewModel.airPressureUnitsString,
                  style: viewModel.cardbodyTextStyle)
            ],
          )),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, AQIAirPressureCardViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            AQIAirPressureCardViewModel.create(store),
        builder: (BuildContext context, AQIAirPressureCardViewModel viewModel) {
          final double _sw = MediaQuery.of(context).size.width;

          return Container(
              width: _sw - cardMargin,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: viewModel.panelColor),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildAqiSection(viewModel, _sw),
                        _buildAirPressureSection(viewModel, _sw),
                      ])));
        });
  }
}
