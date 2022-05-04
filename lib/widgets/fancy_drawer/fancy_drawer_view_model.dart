import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

@immutable
class FancyDrawerViewModel {
  final Color panelColor;
  final Color textColor;
  final Color drawerColor;
  final Color pointerColor;
  final TextStyle cardHeaderTextStyle;
  final TextStyle cardbodyTextStyle;
  final bool useDarkMode;
  final bool useAnimatedBackgrounds;
  final Function toggleAnimatedBackgrounds;
  final Function toggleDarkMode;
  final IconData toggleDarkModeIcon;
  final IconData toggleAnimBgIcon;
  final Function(int) updateTempUnits;
  final Function(int) updateWindSpeedUnits;
  final Function(int) updateAirPressureUnits;
  final Function(int) updateAQIUnits;
  final List<SimpleLocation> locationList;
  final List<WeatherStateRepository> weatherDataList;
  final String tempUnits;
  final AirPressureUnits airPressureUnits;
  final WindSpeedUnits windSpeedUnits;
  final AQIUnits aqiUnits;

  FancyDrawerViewModel({
    @required this.panelColor,
    @required this.textColor,
    @required this.drawerColor,
    @required this.pointerColor,
    @required this.cardHeaderTextStyle,
    @required this.cardbodyTextStyle,
    @required this.useDarkMode,
    @required this.useAnimatedBackgrounds,
    @required this.toggleAnimatedBackgrounds,
    @required this.toggleDarkMode,
    @required this.toggleDarkModeIcon,
    @required this.toggleAnimBgIcon,
    @required this.updateTempUnits,
    @required this.updateWindSpeedUnits,
    @required this.updateAirPressureUnits,
    @required this.updateAQIUnits,
    @required this.locationList,
    @required this.weatherDataList,
    @required this.tempUnits,
    @required this.airPressureUnits,
    @required this.windSpeedUnits,
    @required this.aqiUnits,
  });

  factory FancyDrawerViewModel.create(Store<GlobalAppState> store) {
    // ignore: unused_element
    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    void _toggleDarkMode() {
      store.dispatch(ToggleDarkModeAction());
    }

    void _toggleAnimatedBackgrounds() {
      store.dispatch(ToggleAnimatedBackgroundsAction());
    }

    void _updateTempUnits(int index) {
      switch (index) {
        case 0:
          store.dispatch(ChangeTempUnitsAction(TempUnits.C));
          break;
        case 1:
          store.dispatch(ChangeTempUnitsAction(TempUnits.F));
          break;
        case 2:
          store.dispatch(ChangeTempUnitsAction(TempUnits.K));
          break;
      }
    }

    void _updateWindSpeedUnits(int index) {
      switch (index) {
        case 0:
          store.dispatch(ChangeWindSpeedUnitsAction(WindSpeedUnits.Kph));
          break;
        case 1:
          store.dispatch(ChangeWindSpeedUnitsAction(WindSpeedUnits.Mph));
          break;
        case 2:
          store.dispatch(ChangeWindSpeedUnitsAction(WindSpeedUnits.Knots));
          break;
        case 3:
          store.dispatch(ChangeWindSpeedUnitsAction(WindSpeedUnits.Ms));
          break;
      }
    }

    void _updateAirPressureUnits(int index) {
      switch (index) {
        case 0:
          store.dispatch(ChangeAirPressureUnitsAction(AirPressureUnits.Kpa));
          break;
        case 1:
          store.dispatch(ChangeAirPressureUnitsAction(AirPressureUnits.Inch));
          break;
        case 2:
          store.dispatch(ChangeAirPressureUnitsAction(AirPressureUnits.Mbar));
          break;
        case 3:
          store.dispatch(ChangeAirPressureUnitsAction(AirPressureUnits.Atm));
          break;
      }
    }

    void _updateAQIUnits(int index) {
      switch (index) {
        case 0:
          store.dispatch(ChangeAQIUnitsAction(AQIUnits.US));
          break;
        case 1:
          store.dispatch(ChangeAQIUnitsAction(AQIUnits.GB));
          break;
      }
    }

    // ignore: missing_return
    Color getPointerColor() {
      bool _useBG = store.state.userSettings.useAnimatedBackgrounds;
      bool _useDM = store.state.userSettings.useDarkMode;

      if (_useDM && _useBG) {
        return Colors.white;
      } else if (_useDM && !_useBG) {
        return Colors.white;
      } else if (!_useDM && _useBG) {
        return Colors.white;
      } else if (!_useDM && !_useBG) {
        return Colors.black;
      }
    }

    String getTempUnitsString() {
      switch (store.state.userSettings.tempUnits) {
        case TempUnits.C:
          return 'c';
          break;
        case TempUnits.F:
          return 'F';
          break;
        case TempUnits.K:
          return 'K';
          break;
      }
      return 'c';
    }

    return FancyDrawerViewModel(
      aqiUnits: store.state.userSettings.aqiUnits,
      windSpeedUnits: store.state.userSettings.windSpeedUnits,
      updateTempUnits: (int index) => _updateTempUnits(index),
      updateWindSpeedUnits: (int index) => _updateWindSpeedUnits(index),
      updateAirPressureUnits: (int index) => _updateAirPressureUnits(index),
      updateAQIUnits: (int index) => _updateAQIUnits(index),
      panelColor:
          store.state.userSettings.useDarkMode ? darkGrey : bgColorLightMode,
      drawerColor: store.state.userSettings.useDarkMode
          ? black.withOpacity(0.85)
          : bgColorLightMode.withOpacity(0.85),
      textColor: store.state.userSettings.useDarkMode ? white : black,
      toggleDarkModeIcon: store.state.userSettings.useDarkMode
          ? Icons.toggle_on_outlined
          : Icons.toggle_off_outlined,
      toggleAnimBgIcon: store.state.userSettings.useAnimatedBackgrounds
          ? Icons.toggle_on_outlined
          : Icons.toggle_off_outlined,
      useAnimatedBackgrounds: store.state.userSettings.useAnimatedBackgrounds,
      useDarkMode: store.state.userSettings.useDarkMode,
      toggleAnimatedBackgrounds: _toggleAnimatedBackgrounds,
      toggleDarkMode: _toggleDarkMode,
      locationList: store.state.locationList,
      weatherDataList: store.state.weatherDataList,
      airPressureUnits: store.state.userSettings.airPressureUnits,
      tempUnits: getTempUnitsString(),
      pointerColor: getPointerColor(),
      cardHeaderTextStyle: cardHeaderStyle.copyWith(
          color: store.state.userSettings.useDarkMode
              ? textColorDarkMode
              : textColorLightMode),
      cardbodyTextStyle: cardBodyStyle.copyWith(
          color: store.state.userSettings.useDarkMode
              ? textColorDarkMode
              : textColorLightMode),
    );
  }
}
