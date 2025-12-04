import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BranchMapPage extends StatefulWidget {
  @override
  State<BranchMapPage> createState() => _BranchMapPageState();
}

class _BranchMapPageState extends State<BranchMapPage> {
  //posición de la sucursal
  static const LatLng _branchPosition = LatLng(18.9261, -99.2216);
  
  static const CameraPosition _initialCamera = CameraPosition(
    target: _branchPosition,
    zoom: 16,
  );

  //marcadores
  final Set<Marker> _markers = {};
  
  GoogleMapController? controller;
  
  @override
  void initState() {
    super.initState();
    _markers.add(
      Marker(
        markerId: MarkerId('branch'),
        position: _branchPosition,
        infoWindow: InfoWindow(title: 'Sucursal Principal'),
      ),
    );
  }

  // cpnstruir mapa
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mapa de sucursal'),
      ),
      body: GoogleMap(
        onMapCreated: (c) => controller = c,
        initialCameraPosition: _initialCamera,
        markers: _markers,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: true,
      ),
    );
  }
}