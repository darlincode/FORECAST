import 'package:fancy_weather/models/models.dart';

class GetCurrentLocationAction {
  GetCurrentLocationAction();
}

class AddLocationAction {
  final Location location;
  AddLocationAction(this.location);
}

class RemoveLocationAction {
  final int id;
  RemoveLocationAction(this.id);
}

class ClearLocationsAction {
  ClearLocationsAction();
}
