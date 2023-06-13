import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Center(child: Text("GOOGLE MAPS")),
        ),
        body: const MyMap(),
      ),
    );
  }
}

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  LatLng showLocation1 = LatLng(3.6084723, 98.6205504);
  LatLng showLocation2 = LatLng(-6.175, 106.8258); //monas
  Set<Marker> marker1 = Set();

  @override
  void initState() {
    marker1.add(
      Marker(
          markerId: MarkerId(showLocation1.toString()),
          position: showLocation2,
          infoWindow: const InfoWindow(
            title: "My Location",
            snippet: "INDONESIA",
          )),
    );
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        initialCameraPosition:
            CameraPosition(target: showLocation2, tilt: 85.0, zoom: 15),
        markers: marker1,
        mapType: MapType.satellite,
      ),
    );
  }
}
