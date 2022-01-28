import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 96,
            width: 96,
            child: Image.asset('assets/images/logo/app_icon.png'),
          ),
          SizedBox(height: 32),
          Text(tr('loading')),
          SizedBox(height: 16),
          SizedBox(
            height: 32,
            width: 32,
            child: Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
