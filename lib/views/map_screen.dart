import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapScreen extends StatelessWidget {
  final double latitude;
  final double longitude;

  MapScreen({
    Key? key,
    this.latitude = 31.6300,  // مراكش
    this.longitude = -8.0089,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CameraPosition initialPosition = CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 12,
    );

    return Scaffold(
      appBar: AppBar(title: Text('الموقع على الخريطة')),
      body: GoogleMap(
        initialCameraPosition: initialPosition,
        markers: {
          Marker(
            markerId: MarkerId("trip_location"),
            position: LatLng(latitude, longitude),
            infoWindow: InfoWindow(title: "موقع الرحلة"),
          ),
        },
      ),
    );
  }
}