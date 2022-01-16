import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/screens/settings_screen/settings_screen_view_model.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key key}) : super(key: key);

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StoreConnector<GlobalAppState, SettingsScreenViewModel>(
        distinct: true,
        converter: (store) => SettingsScreenViewModel.create(store),
        builder: (context, viewModel) {
          final double _sw = MediaQuery.of(context).size.width;
          final double _sh = MediaQuery.of(context).size.height;

          return Container(
            color: viewModel.useDarkMode
                ? bgColorDarkMode.withOpacity(0.85)
                : bgColorLightMode.withOpacity(0.85),
            height: _sh,
            width: _sw,
            child: SafeArea(
              child: ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                      trailing: IconButton(
                          icon: Icon(viewModel.toggleAnimBgIcon,
                              color: viewModel.textColor),
                          onPressed: () => viewModel.toggleAnimatedBackgrounds),
                      title: Text(
                        tr(
                          viewModel.useAnimatedBackgrounds
                              ? 'settings.disable_backgrounds'
                              : 'settings.enable_backgrounds',
                        ),
                        style: TextStyle(color: viewModel.textColor),
                      )),
                  ListTile(
                      trailing: IconButton(
                          icon: Icon(viewModel.toggleDarkModeIcon,
                              color: viewModel.textColor),
                          onPressed: () => viewModel.toggleDarkMode),
                      title: Text(
                        tr(
                          viewModel.useDarkMode
                              ? 'settings.disable_dark_mode'
                              : 'settings.enable_dark_mode',
                        ),
                        style: TextStyle(color: viewModel.textColor),
                      )),
                  ListTile(
                      trailing: IconButton(
                          icon: Icon(Icons.refresh, color: viewModel.textColor),
                          onPressed: () => viewModel.refreshWeatherData),
                      title: Text(
                        tr('refresh'),
                        style: TextStyle(color: viewModel.textColor),
                      )),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
