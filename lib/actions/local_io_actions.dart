import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// Load user data from local storage
@immutable
class LoadLocalDataAction {}

/// Save user data to local storage
@immutable
class SaveLocalDataAction {
  final SettingsStateRepository userSettings;
  SaveLocalDataAction(this.userSettings);

  @override
  String toString() {
    return 'SaveLocalDataAction{localData: $userSettings}';
  }
}
