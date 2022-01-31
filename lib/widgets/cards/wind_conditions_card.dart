import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/widgets/widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class WindConditionsCard extends StatelessWidget {
  const WindConditionsCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, WidgetViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            WidgetViewModel.create(store),
        builder: (BuildContext context, WidgetViewModel viewModel) {
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
                  Text(tr('cards.titles.wind_conditions'),
                      style: viewModel.cardHeaderTextStyle),
                  SizedBox(height: 4),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildWindSpeedSection(viewModel, _sw),
                        _buildWindCompass(viewModel, _sw),
                      ]),
                ]),
              ));
        });
  }

  Widget _buildWindCompass(WidgetViewModel viewModel, double _sw) {
    return SizedBox(
        width: (_sw / 2) - 48,
        height: 60,
        child: Stack(children: [
          SfRadialGauge(axes: [
            RadialAxis(
                axisLineStyle: AxisLineStyle(thickness: 3),
                minimum: 0,
                maximum: 360,
                pointers: [
                  MarkerPointer(
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
              child: Text('${viewModel.currentWindDegreesString}',
                  style: TextStyle(
                      color:
                          viewModel.useDarkMode ? Colors.white : Colors.black)))
        ]));
  }

  Widget _buildWindSpeedSection(WidgetViewModel viewModel, double _sw) {
    return SizedBox(
      width: (_sw / 2) - 48,
      child: Column(children: [
        Text(viewModel.currentWindSpeed.toString(),
            style: viewModel.cardbodyTextStyle),
        Text(viewModel.windSpeedUnits, style: viewModel.cardbodyTextStyle)
      ]),
    );
  }
}
