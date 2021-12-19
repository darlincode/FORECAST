import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

@immutable
class GetCurrentLocationAction {
  GetCurrentLocationAction();
}

@immutable
class SetCurrentLocationAction {
  final Location location;
  SetCurrentLocationAction(this.location);
}

@immutable
class AddLocationAction {
  final Location location;
  AddLocationAction(this.location);
}

@immutable
class RemoveLocationAction {
  final int id;
  RemoveLocationAction(this.id);
}

@immutable
class ClearLocationsAction {
  ClearLocationsAction();
}
