import 'dart:convert';

import 'package:fancy_weather/config/config.dart';
import 'package:fancy_weather/models/models.dart';
import 'package:http/http.dart' as http;

class PlaceApiProvider {
  PlaceApiProvider(this.sessionToken);

  final String sessionToken;
  final apiKey = getGoogleKey();

  http.Request createGetRequest(String url) =>
      http.Request('GET', Uri.parse(url));

  Future<List<Suggestion>> fetchSuggestions(String input) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&key=$apiKey&sessiontoken=$sessionToken';
    // 'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$input&components=country:sg&key=$apiKey&sessiontoken=$sessionToken';
    var request = createGetRequest(url);
    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final result = json.decode(data);

      print(result);

      if (result['status'] == 'OK') {
        return result['predictions']
            .map<Suggestion>((p) => Suggestion(p['place_id'], p['description'],
                p['structured_formatting']['main_text']))
            .toList();
      }
      if (result['status'] == 'ZERO_RESULTS') {
        return [];
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }

  Future<SimpleLocation> getPlaceDetailFromId(String placeId) async {
    final url =
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&fields=formatted_address,name,geometry/location&key=$apiKey&sessiontoken=$sessionToken';
    var request = createGetRequest(url);
    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final data = await response.stream.bytesToString();
      final result = json.decode(data);
      print(result);

      if (result['status'] == 'OK') {
        // build result
        final place = SimpleLocation.createEmpty().copyWith(
          latitude: result['result']['geometry']['location']['lat'],
          longitude: result['result']['geometry']['location']['lng'],
        );
        // place.latitude = result['result']['geometry']['location']['lat'];
        // place.longitude = result['result']['geometry']['location']['lng'];
        return place;
      }
      throw Exception(result['error_message']);
    } else {
      throw Exception('Failed to fetch suggestion');
    }
  }
}

class Suggestion {
  Suggestion(p, p2, p3);
}
