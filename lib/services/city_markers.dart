import 'package:http/http.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:convert';

class CityMarkers {

  Set<Marker> markers = {};
  String continent;

  CityMarkers({required this.continent});

  Future<void> getMarkers() async {
    try {
      Response response = await get(Uri(
          scheme: 'https',
          host: 'restcountries.com',
          path: 'v3.1/region/$continent'));
      List data = jsonDecode(response.body);

      markers = data.map((country) =>
          Marker(
              markerId: MarkerId(country['name']['common']),
              position: LatLng(
                  country['capitalInfo']['latlng'][0],
                  country['capitalInfo']['latlng'][1]
              ))).toSet();
    }
    catch (e) {
      print(e);
    }
  }
}