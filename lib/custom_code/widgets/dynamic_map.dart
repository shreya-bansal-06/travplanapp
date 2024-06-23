// Automatic FlutterFlow imports
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart' as ll;

class DynamicMap extends StatefulWidget {
  const DynamicMap({
    super.key,
    this.width,
    this.height,
    this.points,
    required this.accessToken,
    required this.startingPoint,
    required this.startingZoom,
  });

  final double? width;
  final double? height;
  final List<LatLng>? points;
  final String accessToken;
  final LatLng startingPoint;
  final double startingZoom;

  @override
  State<DynamicMap> createState() => _DynamicMapState();
}

class _DynamicMapState extends State<DynamicMap> {
  List<Marker> allMarkers = [];

  @override
  void initState() {
    super.initState();
    addMarkersToMap(widget.points);
  }

  void addMarkersToMap(List<LatLng>? points) {
    for (LatLng point in points!) {
      allMarkers.add(
        Marker(
          point: ll.LatLng(point.latitude, point.longitude),
          height: 12,
          width: 12,
          alignment: Alignment(0, 0),
          rotate: false,
          child: new Icon(Icons.location_pin, size: 20),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return FlutterMap(
      options: MapOptions(
        initialCenter: ll.LatLng(
            widget.startingPoint.latitude, widget.startingPoint.longitude),
        initialZoom: widget.startingZoom,
      ),
      children: [
        TileLayer(
          urlTemplate:
              'https://api.mapbox.com/styles/v1/shreya1234/clxfumwdy005x01qmhbxh0rl4/tiles/256/{z}/{x}/{y}@2x?access_token=${widget.accessToken}&zoomwheel=true&fresh=true#6.78/28.003/77.347',
        ),
        MarkerLayer(
          markers: allMarkers,
        )
      ],
    );
  }
}
