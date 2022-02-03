import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/widgets/cards/astro_data_card/astro_data_card_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class AstroDataCard extends StatelessWidget {
  const AstroDataCard({Key key}) : super(key: key);

  Widget _buildSunsetGauge(AstroDataCardViewModel viewModel, double _sw) {
    int _sunriseTime = viewModel.sunriseTimeMS;
    int _sunsetTime = viewModel.sunsetTimeMS;
    // int _sunriseTime = 7;
    // int _sunsetTime = 22;

    return SizedBox(
        width: _sw / 3,
        child: Column(children: [
          Text(tr('cards.titles.sunset'),
              textAlign: TextAlign.center,
              style: viewModel.cardHeaderTextStyle),
          const SizedBox(height: 4),
          Container(
              width: (_sw / 2) - 48,
              height: 100,
              child: Stack(children: [
                SfRadialGauge(axes: [
                  RadialAxis(
                      annotations: [
                        GaugeAnnotation(
                            widget: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child: Row(children: [
                                  Text('${viewModel.sunriseTime}',
                                      style: viewModel.timeStyle),
                                  Spacer(),
                                  Text('${viewModel.sunsetTime}',
                                      style: viewModel.timeStyle),
                                ])))
                      ],
                      interval: 180,
                      startAngle: 180,
                      endAngle: 0,
                      axisLineStyle: AxisLineStyle(
                          color: Colors.grey,
                          gradient: SweepGradient(colors: [
                            Color(0XFF000070),
                            Colors.orange,
                            Colors.yellow,
                            Colors.orange,
                            Color(0XFF000070)
                          ], stops: [
                            0.01,
                            0.2,
                            0.5,
                            0.8,
                            0.99
                          ]),
                          thickness: 3),
                      pointers: [
                        MarkerPointer(
                          markerHeight: 24,
                          markerWidth: 24,
                          elevation: 4,
                          color: Colors.yellow.withOpacity(0.9),
                          value: viewModel.timeNowMS.toDouble(),
                          markerType: MarkerType.image,
                          imageUrl: 'assets/images/sun-2.png',
                        )
                      ],
                      canScaleToFit: true,
                      minimum: _sunriseTime.toDouble(),
                      maximum: _sunsetTime.toDouble(),
                      showTicks: false,
                      showLabels: false)
                ])
              ]))
        ]));
  }

  Widget _buildMoonPhaseWidget(AstroDataCardViewModel viewModel, double _sw) {
    return SizedBox(
      width: _sw / 3,
      child: Column(
        children: [
          Text(tr('cards.titles.moon-phase'),
              style: viewModel.cardHeaderTextStyle),
          const SizedBox(height: 4),
          Container(
            width: (_sw / 2) - 48,
            height: 100,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, AstroDataCardViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            AstroDataCardViewModel.create(store),
        builder: (BuildContext context, AstroDataCardViewModel viewModel) {
          final double _sw = MediaQuery.of(context).size.width;

          return Container(
              width: _sw - 64,
              padding: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: viewModel.panelColor,
              ),
              child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildSunsetGauge(viewModel, _sw),
                          _buildMoonPhaseWidget(viewModel, _sw),
                        ])
                  ])));
        });
  }
}
