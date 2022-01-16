import 'package:fancy_weather/models/models.dart';
import 'package:flutter/material.dart';

/// Updates the current locationList state
@immutable
class UpdateLocationListAction {
  final List<SimpleLocation> locations;
  UpdateLocationListAction(this.locations);
}

/// Grab the user's current coordinates
@immutable
class GrabCurrentCoordsAction {}

/// Update the coordinates of a certain list entry
/// ie - Overwrite current coords if user changes location
@immutable
class ReplaceCoordsInLocationListAction {
  final int index;
  final double latitude, longitude;
  ReplaceCoordsInLocationListAction({
    this.index,
    this.latitude,
    this.longitude,
  });

  @override
  String toString() {
    return 'GrabCurrentCoordsAction{index: $index, x: $latitude, y: $longitude}';
  }
}

/// Set the index of the active location in the locationList
@immutable
class SetActiveLocationIndexAction {
  final int index;
  SetActiveLocationIndexAction({this.index});

  @override
  String toString() {
    return 'SetActiveLocationIndexAction{index: $index}';
  }
}

/// Add new coordinates to the locationList
@immutable
class AddCoordsToLocationListAction {
  final SimpleLocation location;
  AddCoordsToLocationListAction(this.location);

  @override
  String toString() {
    return 'AddCoordsToLocationListAction{location: $location}';
  }
}

/// Clear all entries in locationList (except [0])
@immutable
class ClearLocationListAction {}

/// Delete a location from locationList using passed id
@immutable
class DeleteLocationFromListAction {
  final String id;
  DeleteLocationFromListAction(this.id);

  @override
  String toString() {
    return 'DeleteLocationFromListAction{id: $id}';
  }
}
