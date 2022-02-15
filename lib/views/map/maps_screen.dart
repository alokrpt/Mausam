import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../services/map_overlay_service.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(0.0, 0.0);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  bool prepMap = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          setState(() {
            prepMap = !prepMap;
          });
          debugPrint(prepMap.toString());
        },
        isExtended: true,
        tooltip: "Click to change map overlay",
        label: Text(prepMap ? "Temperature" : "Precipitation"),
        icon: Icon(!prepMap
            ? Icons.cloud_outlined
            : Icons.local_fire_department_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      body: GoogleMap(
        onCameraMove: (position) {
          // debugPrint(position.zoom.toString()+position.target.toString());
        },
        tileOverlays: {
          prepMap
              ? TileOverlay(
                  tileOverlayId: const TileOverlayId('precipitation_new_id'),
                  tileProvider: TestTileProvider(mapType: "precipitation_new"),
                )
              : TileOverlay(
                  tileOverlayId: const TileOverlayId('temp_new_id'),
                  tileProvider: TestTileProvider(mapType: "temp_new"),
                )
        },
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 3,
        ),
      ),
    );
  }
}
