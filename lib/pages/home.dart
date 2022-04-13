import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:testmaps/services/city_markers.dart';

class MapScreen extends StatefulWidget {

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  static const _initialCameraPosition = CameraPosition(
      target: LatLng(50.83, 4.33),
      zoom: 3
  );

  Set<Marker> markers = {};

  void setupMarkers() async {
    CityMarkers cityMarkers = CityMarkers(continent: 'europe');
    await cityMarkers.getMarkers();
    setState(() {
      markers = cityMarkers.markers;
    });
  }

  @override
  void initState() {
    super.initState();
    setupMarkers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition: _initialCameraPosition,
        markers: markers.map((marker) => Marker(
            markerId: marker.markerId,
            position: marker.position,
        onTap: () {
          Navigator.pushNamed(context, '/loading', arguments: {
            'name': marker.markerId.value
          });
        })).toSet(),
      ),
    );
  }
}