import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/widgets/widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

@immutable
class HumidityUVCard extends StatelessWidget {
  const HumidityUVCard({Key key}) : super(key: key);

  Widget _buildHumiditySection(WidgetViewModel viewModel, double _sw) {
    return SizedBox(
        width: _sw / 3,
        child: Column(children: [
          Text(tr('cards.titles.humidity'),
              style: viewModel.cardHeaderTextStyle),
          SizedBox(height: 4),
          Text(tr('${viewModel.currentHumidity}%'),
              style: viewModel.cardbodyTextStyle),
        ]));
  }

  Widget _buildUVIndexSection(WidgetViewModel viewModel, double _sw) {
    return SizedBox(
        width: _sw / 3,
        child: Column(children: [
          Text(
            tr('cards.titles.uv-index'),
            style: viewModel.cardHeaderTextStyle,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 4),
          Text(tr('${viewModel.currentUV}'),
              style: viewModel.cardbodyTextStyle),
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return StoreConnector<GlobalAppState, WidgetViewModel>(
        distinct: true,
        converter: (Store<GlobalAppState> store) =>
            WidgetViewModel.create(store),
        builder: (context, viewModel) {
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
