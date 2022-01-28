import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:fancy_weather/utilities/forecast_icons.dart';
import 'package:fancy_weather/widgets/widget_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:redux/redux.dart';
import 'package:toggle_switch/toggle_switch.dart';

class FancyDrawer extends StatefulWidget {
  const FancyDrawer({Key key}) : super(key: key);

  @override
  State<FancyDrawer> createState() => _FancyDrawerState();
}

class _FancyDrawerState extends State<FancyDrawer> {
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
                color: viewModel.drawerColor.withOpacity(0.85),
                height: _sh,
                child: SafeArea(
                    child: SingleChildScrollView(
                        child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
                            child: Column(children: [
                              SizedBox(height: 16),
                              _buildSettingsSection(viewModel),
                              SizedBox(height: 16),
                              _buildLocationSection(viewModel),
                              SizedBox(height: 16),
                              _buildAboutAppSection(viewModel),
                              SizedBox(height: 32),
                              _buildCloseSettingsBtn(viewModel),
                            ])))))
            : Container(
                height: _sh, width: _sw * 0.8, color: Colors.transparent);
      },
    );
  }

  Widget _buildSettingsSection(WidgetViewModel viewModel) {
    return Container(
      decoration: BoxDecoration(
        color: viewModel.drawerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ExpansionTile(
        title: _buildSettingsHeader(viewModel),
        iconColor: grey,
        collapsedIconColor: grey,
        children: [
          _buildLanguageSelector(viewModel, context),
          SizedBox(height: 16),
          _buildAnimatedBackgroundToggle(viewModel),
          SizedBox(height: 16),
          _buildDarkModeToggle(viewModel),
          SizedBox(height: 16),
          _buildTempUnitsSelector(viewModel),
          SizedBox(height: 16),
          _buildWindSpeedUnitsSelector(viewModel),
          SizedBox(height: 16),
          _buildAirPressureUnitsSelector(viewModel),
          SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildLocationSection(WidgetViewModel viewModel) {
    return Container(
        decoration: BoxDecoration(
            color: viewModel.drawerColor,
            borderRadius: BorderRadius.circular(8)),
        child: ExpansionTile(
            title: _buildLocationsHeader(viewModel),
            iconColor: grey,
            collapsedIconColor: grey,
            children: [
              _buildLocationSelector(viewModel),
              _buildLocationsList(viewModel),
            ]));
  }

  Widget _buildAboutAppSection(WidgetViewModel viewModel) {
    return Container(
        decoration: BoxDecoration(
            color: viewModel.drawerColor,
            borderRadius: BorderRadius.circular(8)),
        child: ExpansionTile(
          title: Text(tr('settings.about_app'),
              style:
                  drawerHeaderTextStyle.copyWith(color: viewModel.textColor)),
          iconColor: grey,
          collapsedIconColor: grey,
          children: [],
        ));
  }

  /// Settings tile header
  Widget _buildSettingsHeader(WidgetViewModel viewModel) {
    return Text(tr('settings.settings_header'),
        style: drawerHeaderTextStyle.copyWith(color: viewModel.textColor));
  }

  /// Switch to enable/disable animated backgrounds - default ENABLED
  Widget _buildAnimatedBackgroundToggle(WidgetViewModel viewModel) {
    int _index = 0;
    if (viewModel.useAnimatedBackgrounds) {
      _index = 1;
    } else {
      _index = 0;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            tr('settings.enable_dark_mode'),
            style: TextStyle(color: viewModel.textColor),
          ),
        ),
        settingsPicker(
          context: context,
          initialIndex: _index,
          labels: [tr('settings.off'), tr('settings.on')],
          totalSwitches: 2,
          viewModel: viewModel,
          onToggleFn: (_) => {viewModel.toggleAnimatedBackgrounds()},
        ),
      ],
    );
  }

  /// Switch to enable/disable dark theme - default DISABLED
  Widget _buildDarkModeToggle(WidgetViewModel viewModel) {
    int _index = 0;
    if (viewModel.useDarkMode) {
      _index = 1;
    } else {
      _index = 0;
    }
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(
            tr('settings.enable_dark_mode'),
            style: TextStyle(color: viewModel.textColor),
          ),
        ),
        settingsPicker(
          context: context,
          initialIndex: _index,
          labels: [tr('settings.off'), tr('settings.on')],
          totalSwitches: 2,
          viewModel: viewModel,
          onToggleFn: (_) => {viewModel.toggleDarkMode()},
        ),
      ],
    );
  }

  /// Locations tile header
  Widget _buildLocationsHeader(WidgetViewModel viewModel) {
    return Text(tr('settings.locations_header'),
        style: drawerHeaderTextStyle.copyWith(color: viewModel.textColor));
  }

  /// Search bar to add locations
  Widget _buildLocationSelector(WidgetViewModel viewModel) {
    final _locationController = TextEditingController();

    return Container(
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: viewModel.textColor)),
            child: TextField(
                style: TextStyle(fontSize: 16, overflow: TextOverflow.visible),
                controller: _locationController,
                onTap: () async {},
                decoration: InputDecoration(
                    icon: Container(
                        margin: EdgeInsets.only(left: 16),
                        width: 20,
                        height: 20,
                        child: SvgPicture.asset(ForecastIcons.search_location,
                            color: viewModel.textColor)),
                    isDense: true,
                    hintText: tr('settings.find_location'),
                    hintStyle:
                        TextStyle(color: viewModel.textColor.withOpacity(0.6)),
                    border: InputBorder.none))));
  }

  /// ListBuilder of locations
  Widget _buildLocationsList(WidgetViewModel viewModel) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: viewModel.locationList.length,
        itemBuilder: (ctx, i) {
          //TODO: Make the listTile fancier with dynamic background
          return ListTile(
              title: Text(
                  i == 0
                      ? tr('settings.current_location')
                      : viewModel.weatherDataList[i].location.name,
                  style: TextStyle(color: viewModel.textColor)),
              trailing: i == 0 ? null : Icon(Icons.delete));
        });
    //   listtile with name, current temp, anim background
  }

  /// Language Selector - default EN
  Widget _buildLanguageSelector(
      WidgetViewModel viewModel, BuildContext context) {
    int _index = 0;

    switch (context.locale.toString()) {
      case 'en':
        _index = 0;
        break;
      case 'fr':
        _index = 1;
        break;
      case 'es':
        _index = 2;
        break;
    }
    return ListTile(
        title: Column(children: [
      Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Text(tr('settings.select_language'),
              style: TextStyle(color: viewModel.textColor))),
      settingsPicker(
        viewModel: viewModel,
        initialIndex: _index,
        labels: [tr('settings.en'), tr('settings.fr'), tr('settings.es')],
        onToggleFn: (index) {
          switch (index) {
            case 0:
              context.setLocale(Locale('en'));
              break;
            case 1:
              context.setLocale(Locale('fr'));
              break;
            case 2:
              context.setLocale(Locale('es'));
              break;
          }
        },
        totalSwitches: 3,
        context: context,
      ),
    ]));
  }

  /// Button to close settings panel
  Widget _buildCloseSettingsBtn(viewModel) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: viewModel.drawerColor, onPrimary: viewModel.textColor),
        child: Text(tr('close')),
        onPressed: () {
          Navigator.of(context).pop();
        });
  }

  /// Temp Units selector - default c
  Widget _buildTempUnitsSelector(WidgetViewModel viewModel) {
    int _index = 0;
    switch (viewModel.tempUnits) {
      case 'c':
        _index = 0;
        break;
      case 'F':
        _index = 1;
        break;
      case 'K':
        _index = 2;
        break;
    }
    return ListTile(
        title: Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(tr('settings.temp_units'), // TODO: Add translation
            style: TextStyle(color: viewModel.textColor)),
      ),
      settingsPicker(
        viewModel: viewModel,
        initialIndex: _index,
        labels: ['C', 'F', 'K'],
        onToggleFn: (index) => viewModel.updateTempUnits(index),
        totalSwitches: 3,
        context: context,
      ),
    ]));
  }

  /// Wind Speed Units selector - default km/h
  Widget _buildWindSpeedUnitsSelector(WidgetViewModel viewModel) {
    int _index = 0;
    switch (viewModel.windSpeedUnits) {
      case 'km/h':
        _index = 0;
        break;
      case 'mph':
        _index = 1;
        break;
      case 'kts':
        _index = 2;
        break;
      case 'm/s':
        _index = 3;
        break;
    }
    return ListTile(
        title: Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          tr('settings.wind_speed_units'),
          style: TextStyle(color: viewModel.textColor),
        ),
      ),
      settingsPicker(
        viewModel: viewModel,
        initialIndex: _index,
        labels: ['km/h', 'mph', 'knots', 'm/s'],
        onToggleFn: (index) => viewModel.updateWindSpeedUnits(index),
        totalSwitches: 4,
        context: context,
      ),
    ]));
  }

  /// Air Pressure Units selector - default kPa
  Widget _buildAirPressureUnitsSelector(WidgetViewModel viewModel) {
    int _index = 0;
    switch (viewModel.airPressureUnits) {
      case 'Kpa':
        _index = 0;
        break;
      case 'inch':
        _index = 1;
        break;
      case 'Mbar':
        _index = 2;
        break;
      case 'ATM':
        _index = 3;
        break;
    }
    return ListTile(
        title: Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Text(
          tr('settings.air_pressure_units'),
          style: TextStyle(color: viewModel.textColor),
        ),
      ),
      settingsPicker(
        viewModel: viewModel,
        initialIndex: _index,
        labels: ['Kpa', 'inch', 'Mbar', 'ATM'],
        onToggleFn: (index) => viewModel.updateAirPressureUnits(index),
        totalSwitches: 4,
        context: context,
      ),
    ]));
  }

  /// Reusable ToggleSwitch
  Widget settingsPicker({
    WidgetViewModel viewModel,
    int totalSwitches,
    int initialIndex,
    List<String> labels,
    Function onToggleFn,
    BuildContext context,
  }) {
    List<double> _widths = [];
    final double _sw = (MediaQuery.of(context).size.width - 72);
    final double halfSw = _sw / 2;
    final double thirdSw = _sw / 3;
    final double quarterSw = _sw / 4;

    switch (totalSwitches) {
      case 2:
        _widths = [halfSw, halfSw];
        break;
      case 3:
        _widths = [thirdSw, thirdSw, thirdSw];
        break;
      case 4:
        _widths = [quarterSw, quarterSw, quarterSw, quarterSw];
        break;
    }
    return ToggleSwitch(
      customWidths: _widths,
      initialLabelIndex: initialIndex,
      totalSwitches: totalSwitches,
      labels: labels,
      onToggle: (index) => onToggleFn(index),
      // fontSize: 12,
      // minHeight: 32,
      animate: true,
      curve: Curves.easeInOut,
      animationDuration: 250,
      inactiveFgColor: viewModel.textColor,
      inactiveBgColor: viewModel.useDarkMode ? Color(0xFF303030) : lightGrey,
    );
  }
}
