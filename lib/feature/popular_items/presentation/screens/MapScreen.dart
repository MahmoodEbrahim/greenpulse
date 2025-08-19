import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? selectedLocation;
  GoogleMapController? mapController;

  @override
  void initState() {
    super.initState();
    _checkLocationPermission();
  }

  Future<void> _checkLocationPermission() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.deniedForever) {
      // المستخدم رافض الإذن للأبد → نفتح إعدادات التطبيق
      await Geolocator.openAppSettings();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Select Location")),
      body: GoogleMap(
        initialCameraPosition: const CameraPosition(
          target: LatLng(30.0444, 31.2357),
          zoom: 12,
        ),
        onMapCreated: (controller) {
          mapController = controller;
        },
        onTap: (position) {
          setState(() {
            selectedLocation = position;
          });
        },
        markers: selectedLocation != null
            ? {
          Marker(
            markerId: const MarkerId("selected"),
            position: selectedLocation!,
          )
        }
            : {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if (selectedLocation != null) {
            Navigator.pop(context, selectedLocation);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please select a location")),
            );
          }
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
