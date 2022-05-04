import 'package:easy_localization/easy_localization.dart';
import 'package:fancy_weather/state.dart';
import 'package:fancy_weather/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

@immutable
class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double _sw = MediaQuery.of(context).size.width;
    final double _sh = MediaQuery.of(context).size.height;
    return StoreConnector<GlobalAppState, SplashViewModel>(
      distinct: true,
      converter: (Store<GlobalAppState> store) => SplashViewModel.create(store),
      builder: (context, vm) {
        return Container(
          width: _sw,
          height: _sh,
          color: vm.bgColor,
          child: Center(
              child: Column(mainAxisSize: MainAxisSize.min, children: [
            Image.asset(
              'assets/images/logo/app_icon.png',
              height: 128,
            ),
            const SizedBox(height: 32),
            Text(
              tr('Loading'),
              style: vm.loadingTextStyle,
            ),
            const SizedBox(height: 15),
            const SizedBox(
                height: 47,
                width: 47,
                child: Center(child: CircularProgressIndicator()))
          ])),
        );
      },
    );
  }
}

@immutable
class SplashViewModel {
  final Color bgColor;
  final TextStyle loadingTextStyle;

  SplashViewModel({
    @required this.bgColor,
    @required this.loadingTextStyle,
  });

  factory SplashViewModel.create(Store<GlobalAppState> store) {
    return SplashViewModel(
      bgColor: store.state.userSettings.useDarkMode
          ? bgColorDarkMode
          : bgColorLightMode,
      loadingTextStyle: TextStyle(
          fontSize: 24,
          fontFamily: 'CarroisSC',
          color: store.state.userSettings.useDarkMode ? white : black),
    );
  }
}
