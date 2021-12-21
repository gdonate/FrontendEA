import 'dart:math';
import 'package:flutter/material.dart';

class MapaScreen extends StatefulWidget {
  @override
  _MapaScreenState createState() => _MapaScreenState();
}

class _MapaScreenState extends State<MapaScreen> {
  @override
  Widget build(BuildContext context) {
    return Container();
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text('Encuentra tus intereses'),
    //     ),
    //     body: GoogleMap(
    //       initialCameraPosition: CameraPosition(
    //         target: widget.fromPoint,
    //         zoom:12,
    //       ),
    //       markers: _createMarkers(),
    //       onMapCreated: _onMapCreated,
    //       myLocationEnabled: true,
    //       myLocationButtonEnabled: true,
    //     ),
    //     floatingActionButton: FloatingActionButton(
    //     child: Icon(Icons.zoom_out_map),
    //     onPressed: _centerView,
    //     ),
    //   );
    // }
    // Set<Marker> _createMarkers() {
    //   var tmp = Set<Marker>();

    //   tmp.add(
    //     Marker(
    //       markerId: MarkerId("fromPoint"),
    //       position: widget.fromPoint,
    //       infoWindow: InfoWindow(title: "Uni"),
    //     ),
    //   );
    //   tmp.add(
    //     Marker(
    //       markerId: MarkerId("toPoint"),
    //       position: widget.toPoint,
    //       infoWindow: InfoWindow(title: "Razz"),
    //     ),
    //   );
    //   return tmp;
    // }

    // void _onMapCreated(GoogleMapController controller) {
    //   _mapController = controller;
    //   _centerView();
    // }
    // _centerView() async {

    //   await _mapController.getVisibleRegion();

    //   var left = min(widget.fromPoint.latitude, widget.toPoint.latitude);
    //   var right = max(widget.fromPoint.latitude, widget.toPoint.latitude);
    //   var top = max(widget.fromPoint.longitude, widget.toPoint.longitude);
    //   var bottom = min(widget.fromPoint.longitude, widget.toPoint.longitude);

    //   var bounds = LatLngBounds(
    //     southwest: LatLng(left, bottom),
    //     northeast: LatLng(right, top),
    //   );
    //   var cameraUpdate = CameraUpdate.newLatLngBounds(bounds, 50);
    //   _mapController.animateCamera(cameraUpdate);
  }
}
