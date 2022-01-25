import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/widgets/widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

class FancyEndDrawer extends StatelessWidget {
  const FancyEndDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;
    final double _sh = MediaQuery.of(context).size.height;

    return StoreConnector(
      distinct: true,
      converter: (Store<GlobalAppState> store) => WidgetViewModel.create(store),
      builder: (BuildContext context, WidgetViewModel viewModel) {
        return viewModel != null
            ? Container(
                color: viewModel.drawerColor,
                height: _sh,
                width: _sw * 0.8,
                child: SafeArea(
                  child: Column(
                    children: [
                      // _buildAnimatedBackgroundToggle(viewModel),
                      // _buildDarkModeToggle(viewModel),
                      // _buildRefreshButton(viewModel),
                    ],
                  ),
                ),
              )
            : Container(
                height: _sh,
                width: _sw * 0.8,
                color: Colors.transparent,
              );
      },
    );
  }

  /// Switch to enable/disable animated backgrounds - default ENABLED
  Widget _buildAnimatedBackgroundToggle(WidgetViewModel viewModel) {
    return ListTile(
      trailing: IconButton(
        icon: Icon(viewModel.toggleAnimBgIcon, color: viewModel.textColor),
        onPressed: () => viewModel.toggleAnimatedBackgrounds,
      ),
      title: Text(
        tr(viewModel.toggleAnimBgText),
        style: TextStyle(color: viewModel.textColor),
      ),
    );
  }

  /// Switch to enable/disable dark theme - default DISABLED
  Widget _buildDarkModeToggle(WidgetViewModel viewModel) {
    return ListTile(
      trailing: IconButton(
        icon: Icon(viewModel.toggleDarkModeIcon, color: viewModel.textColor),
        onPressed: () => viewModel.toggleDarkMode,
      ),
      title: Text(
        tr(viewModel.toggleDarkModeBtnText),
        style: TextStyle(color: viewModel.textColor),
      ),
    );
  }

  /// Button to refresh weather data
  Widget _buildRefreshButton(WidgetViewModel viewModel) {
    return ListTile(
      trailing: IconButton(
        icon: Icon(Icons.refresh, color: viewModel.textColor),
        onPressed: () => viewModel.refreshWeatherData,
      ),
      title: Text(
        tr('refresh'),
        style: TextStyle(color: viewModel.textColor),
      ),
    );
  }
}
