import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/widgets/cards/humidity_uv_card/humidity_uv_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

@immutable
class HumidityUVCard extends StatelessWidget {
  const HumidityUVCard({Key key}) : super(key: key);

  Widget _buildHumiditySection(HumidityUVCardViewModel viewModel, double _sw) {
    return SizedBox(
        width: _sw / 3,
        child: Column(children: [
          Text(tr('cards.titles.humidity'),
              style: viewModel.cardHeaderTextStyle),
          SizedBox(height: 4),
          _buildHumidityGauge(viewModel, _sw),
        ]));
  }

  Widget _buildUVIndexSection(HumidityUVCardViewModel viewModel, double _sw) {
    return SizedBox(
        width: _sw / 3,
        child: Column(children: [
          Text(tr('cards.titles.uv-index'),
              style: viewModel.cardHeaderTextStyle,
              textAlign: TextAlign.center),
          SizedBox(height: 4),
          _buildUVGauge(viewModel, _sw),
        ]));
  }

  Widget _buildHumidityGauge(HumidityUVCardViewModel viewModel, double _sw) {
    return SizedBox(
        width: (_sw / 2) - 48,
        height: 80,
        child: Stack(
          children: [
            SfRadialGauge(axes: [
              RadialAxis(
                axisLineStyle: AxisLineStyle(
                    color: Colors.grey,
                    gradient: SweepGradient(
                        colors: [Colors.grey, Colors.blue], stops: [0.3, 0.55]),
                    thickness: 5),
                minimum: 0,
                maximum: 100,
                pointers: [
                  MarkerPointer(
                      color: Colors.white,
                      elevation: 4,
                      markerType: MarkerType.invertedTriangle,
                      value: viewModel.currentHumidity.toDouble())
                ],
                showTicks: false,
                showLabels: false,
              )
            ]),
            Center(
                child: Text('${viewModel.currentHumidity}%',
                    style: viewModel.cardbodyTextStyle)),
          ],
        ));
  }

  Widget _buildUVGauge(HumidityUVCardViewModel viewModel, double _sw) {
    return SizedBox(
        height: 80,
        width: (_sw / 2) - 48,
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text('${viewModel.currentUV}',
              style: viewModel.cardbodyTextStyle.copyWith(fontSize: 24)),
          const SizedBox(height: 8),
          SfLinearGauge(
              showTicks: false,
              interval: 10,
              axisLabelStyle:
                  viewModel.cardbodyTextStyle.copyWith(fontSize: 12),
              axisTrackStyle: LinearAxisTrackStyle(
                  borderWidth: (viewModel.useDarkMode ? 0 : 1),
                  color: Colors.grey,
                  gradient: LinearGradient(colors: [
                    Colors.white.withOpacity(0.6),
                    Colors.red.withOpacity(0.6),
                  ])),
              minimum: 0,
              maximum: 10,
              markerPointers: [
                LinearShapePointer(
                    value: viewModel.currentUV.toDouble(),
                    color: viewModel.pointerColor,
                    height: 8,
                    width: 10)
              ])
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, HumidityUVCardViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            HumidityUVCardViewModel.create(store),
        builder: (BuildContext context, HumidityUVCardViewModel viewModel) {
          final double _sw = MediaQuery.of(context).size.width;
          return Container(
              width: _sw - 64,
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: viewModel.panelColor),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildHumiditySection(viewModel, _sw),
                    _buildUVIndexSection(viewModel, _sw),
                  ]));
        });
  }
}
