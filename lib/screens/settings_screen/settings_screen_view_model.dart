import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

class SettingsScreenViewModel {
  final bool useDarkMode;
  final bool useAnimatedBackgrounds;
  final Function refreshWeatherData;
  final Function toggleAnimatedBackgrounds;
  final Function toggleDarkMode;
  final String toggleDarkModeBtnText;
  final String toggleAnimBgText;
  final IconData toggleDarkModeIcon;
  final IconData toggleAnimBgIcon;
  final Color textColor;
  final Color drawerColor;

  SettingsScreenViewModel(
      {@required this.refreshWeatherData,
      @required this.useDarkMode,
      @required this.useAnimatedBackgrounds,
      @required this.toggleAnimatedBackgrounds,
      @required this.toggleDarkMode,
      @required this.toggleDarkModeBtnText,
      @required this.toggleAnimBgText,
      @required this.toggleDarkModeIcon,
      @required this.toggleAnimBgIcon,
      @required this.textColor,
      @required this.drawerColor});

  factory SettingsScreenViewModel.create(Store<GlobalAppState> store) {
    _getActiveIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    return SettingsScreenViewModel(
      drawerColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode.withOpacity(0.85)
          : bgColorLightMode.withOpacity(0.85),
      textColor: store.state.userSettings.useDarkMode ? white : black,
      toggleDarkModeIcon: store.state.userSettings.useDarkMode
          ? Icons.toggle_on_outlined
          : Icons.toggle_off_outlined,
      toggleAnimBgIcon: store.state.userSettings.useAnimatedBackgrounds
          ? Icons.toggle_on_outlined
          : Icons.toggle_off_outlined,
      toggleAnimBgText: store.state.userSettings.useAnimatedBackgrounds
          ? 'settings.disable_backgrounds'
          : 'settings.enable_backgrounds',
      toggleDarkModeBtnText: store.state.userSettings.useDarkMode
          ? 'settings.disable_dark_mode'
          : 'settings.enable_dark_mode',
      useAnimatedBackgrounds: store.state.userSettings.useAnimatedBackgrounds,
      useDarkMode: store.state.userSettings.useDarkMode,
      refreshWeatherData: store.dispatch(
        FetchWeatherDataAction(
          index: _getActiveIndex(),
          latitude: store.state.locationList[_getActiveIndex()].latitude,
          longitude: store.state.locationList[_getActiveIndex()].longitude,
        ),
      ),
      toggleAnimatedBackgrounds:
          store.dispatch(ToggleAnimatedBackgroundsAction()),
      toggleDarkMode: store.dispatch(ToggleDarkModeAction()),
    );
  }
}
