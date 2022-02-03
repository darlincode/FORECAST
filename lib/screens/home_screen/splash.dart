import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(mainAxisSize: MainAxisSize.min, children: [
      Image.asset(
        'assets/images/logo/app_icon.png',
        height: 128,
      ),
      const SizedBox(height: 32),
      Text(
        tr('loading'),
        style: TextStyle(fontSize: 24, fontFamily: 'CarroisSC'),
      ),
      const SizedBox(height: 16),
      const SizedBox(
          height: 48,
          width: 48,
          child: Center(child: CircularProgressIndicator()))
    ]));
  }
}
