import 'package:fancy_weather/actions/actions.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';

@immutable
class WidgetViewModel {
  final Color panelColor;
  final Color textColor;
  final Color drawerColor;
  final String locale;

  final Function(int) updateTempUnits;
  final Function(int) updateWindSpeedUnits;
  final Function(int) updateAirPressureUnits;

  final bool useDarkMode;
  // final bool isAddLocationMode;
  final bool useAnimatedBackgrounds;

  final Function toggleAnimatedBackgrounds;
  final Function toggleDarkMode;
  // final Function toggleAddLocationField;
  final Function updateLocale;
  final List<SimpleLocation> locationList;
  final List<WeatherStateRepository> weatherDataList;

  /// Fields to control toggle switch colors and appearance
  final String toggleDarkModeBtnText;
  final String toggleAnimBgText;
  final IconData toggleDarkModeIcon;
  final IconData toggleAnimBgIcon;

  final String tempUnits;
  final String windSpeedUnits;
  final String airPressureUnits;

  final String cityName;
  final String conditionsIconUrl;
  final String conditionsString;
  final double currentTemp;
  final double currentRealfeel;

  WidgetViewModel({
    // @required this.refreshWeatherData,
    @required this.updateTempUnits,
    @required this.locale,
    @required this.updateWindSpeedUnits,
    @required this.updateAirPressureUnits,
    @required this.useDarkMode,
    // @required this.isAddLocationMode,
    @required this.useAnimatedBackgrounds,
    @required this.toggleAnimatedBackgrounds,
    @required this.updateLocale,
    @required this.toggleDarkMode,
    // @required this.toggleAddLocationField,
    @required this.toggleDarkModeBtnText,
    @required this.toggleAnimBgText,
    @required this.toggleDarkModeIcon,
    @required this.toggleAnimBgIcon,
    @required this.textColor,
    @required this.panelColor,
    @required this.drawerColor,
    @required this.locationList,
    @required this.weatherDataList,
    @required this.cityName,
    @required this.currentTemp,
    @required this.currentRealfeel,
    @required this.tempUnits,
    @required this.airPressureUnits,
    @required this.windSpeedUnits,
    @required this.conditionsIconUrl,
    @required this.conditionsString,
  });

  factory WidgetViewModel.create(Store<GlobalAppState> store) {
    // int _getActiveIndex() {
    //   return store.state.activeLocationIndex ?? 0;
    // }

    // void _refreshWeatherData() {
    //   store.dispatch(
    //     FetchWeatherDataAction(
    //       index: _getActiveIndex(),
    //       latitude: store.state.locationList[_getActiveIndex()].latitude,
    //       longitude: store.state.locationList[_getActiveIndex()].longitude,
    //     ),
    //   );
    // }

    void _toggleDarkMode() {
      store.dispatch(ToggleDarkModeAction());
    }

    void _toggleAnimatedBackgrounds() {
      store.dispatch(ToggleAnimatedBackgroundsAction());
    }

    // void _toggleAddLocationField() {
    //   store.dispatch(ToggleAddLocationModeAction());
    // }

    void _updateAppLocale(String newLocale) {
      //
    }

    int _getActiveLocationIndex() {
      return store.state.activeLocationIndex ?? 0;
    }

    double getCurrentTemp() {
      switch (store.state.userSettings.tempUnits) {
        case TempUnits.C:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.temp_c ??
              0;
          break;
        case TempUnits.F:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.temp_f ??
              0;
          break;
        case TempUnits.K:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.temp_k ??
              (store.state.weatherDataList[_getActiveLocationIndex()]
                          .currentConditions.temp_c +
                      273.15 ??
                  0);
          break;
      }
      // fallback value, should never be visible
      return 1337.01;
    }

    double getCurrentRealfeel() {
      switch (store.state.userSettings.tempUnits ?? TempUnits.C) {
        case TempUnits.C:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.feelslike_c ??
              0;
          break;
        case TempUnits.F:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.feelslike_f ??
              0;
          break;
        case TempUnits.K:
          return store.state.weatherDataList[_getActiveLocationIndex()]
                  .currentConditions.feelslike_k ??
              (store.state.weatherDataList[_getActiveLocationIndex()]
                          .currentConditions.feelslike_c +
                      273.15 ??
                  0);
          break;
      }

      /// fallback value, should never be visible
      return 1337.01;
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

    String getAirPressureUnitsString() {
      switch (store.state.userSettings.airPressureUnits) {
        case AirPressureUnits.Kpa:
          return 'Kpa';
          break;
        case AirPressureUnits.Inch:
          return 'inch';
          break;
        case AirPressureUnits.Mbar:
          return 'Mbar';
          break;
        case AirPressureUnits.Atm:
          return 'ATM';
          break;
      }
      return 'c';
    }

    String getWindSpeedUnitsString() {
      switch (store.state.userSettings.windSpeedUnits) {
        case WindSpeedUnits.Kph:
          return 'km/h';
          break;
        case WindSpeedUnits.Mph:
          return 'mph';
          break;
        case WindSpeedUnits.Knots:
          return 'kts';
          break;
        case WindSpeedUnits.Ms:
          return 'm/s';
          break;
      }
      return 'c';
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

    return WidgetViewModel(
      // locale: AppLocalizations.
      updateTempUnits: (int index) => _updateTempUnits(index),
      updateWindSpeedUnits: (int index) => _updateWindSpeedUnits(index),
      updateAirPressureUnits: (int index) => _updateAirPressureUnits(index),
      panelColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode.withOpacity(0.45)
          : bgColorLightMode.withOpacity(0.45),
      drawerColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode
          : bgColorLightMode,
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
      toggleAnimatedBackgrounds: _toggleAnimatedBackgrounds,
      toggleDarkMode: _toggleDarkMode,
      locationList: store.state.locationList,
      weatherDataList: store.state.weatherDataList,
      // isAddLocationMode: store.state.userSettings.isAddLocationMode,
      // toggleAddLocationField: _toggleAddLocationField,
      updateLocale: (newLocale) => _updateAppLocale,
      airPressureUnits: getAirPressureUnitsString(),
      cityName:
          store.state.weatherDataList[_getActiveLocationIndex()].location.name,
      conditionsIconUrl: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition.icon,
      conditionsString: store.state.weatherDataList[_getActiveLocationIndex()]
          .currentConditions.condition.text,
      currentTemp: getCurrentTemp(),
      currentRealfeel: getCurrentRealfeel(),
      tempUnits: getTempUnitsString(),
      windSpeedUnits: getWindSpeedUnitsString(),
    );
  }
}
