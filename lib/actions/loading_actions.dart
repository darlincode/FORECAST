import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class SetLoadingStatusAction {
  final LoadingStatus loadingStatus;
  SetLoadingStatusAction(this.loadingStatus);
}
