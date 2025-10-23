import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geocoding/geocoding.dart';

class MapPickerScreen extends StatefulWidget {
  const MapPickerScreen({super.key});

  @override
  State<MapPickerScreen> createState() => _MapPickerScreenState();
}

class _MapPickerScreenState extends State<MapPickerScreen> {
  GoogleMapController? mapController;
  LatLng selectedLocation = const LatLng(-6.200000, 106.816666); // default Jakarta
  String? pickedAddress;

  Future<void> _getAddressFromLatLng(LatLng position) async {
    final placemarks =
        await placemarkFromCoordinates(position.latitude, position.longitude);
    if (placemarks.isNotEmpty) {
      final p = placemarks.first;
      setState(() {
        pickedAddress =
            "${p.street}, ${p.subLocality}, ${p.locality}, ${p.country}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick Location', style: TextStyle(color: Colors.black)),
        centerTitle: true,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(target: selectedLocation, zoom: 14),
            onMapCreated: (controller) => mapController = controller,
            onTap: (pos) async {
              setState(() => selectedLocation = pos);
              await _getAddressFromLatLng(pos);
            },
            markers: {
              Marker(markerId: const MarkerId('picked'), position: selectedLocation),
            },
          ),
          if (pickedAddress != null)
            Positioned(
              bottom: 100,
              left: 16,
              right: 16,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3))
                  ],
                ),
                child: Text(
                  pickedAddress!,
                  style: const TextStyle(fontSize: 14, color: Colors.black87),
                ),
              ),
            ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xFF6CC51D),
        onPressed: () {
          if (pickedAddress != null) {
            Navigator.pop(context, pickedAddress);
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Please pick a location on map")),
            );
          }
        },
        label: const Text("Use this location"),
        icon: const Icon(Icons.check),
      ),
    );
  }
}
