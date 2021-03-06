import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobile_shop/common/strings.dart';

class HomeMap extends StatefulWidget {
  const HomeMap({Key? key}) : super(key: key);

  @override
  _HomeMapState createState() => _HomeMapState();
}

final Set<Marker> _setMarker = {
  const Marker(
      markerId: MarkerId(Strings.markerId1),
      position: LatLng(37.4279613, -122.085749),
      anchor: Offset(0, 0),
      infoWindow: InfoWindow(title: Strings.markerId1InfoWindow),
      rotation: 20.0),
  const Marker(
      markerId: MarkerId(Strings.markerId2),
      position: LatLng(37.4269613, -122.087749)),
  const Marker(
      markerId: MarkerId(Strings.markerId3),
      position: LatLng(37.4169613, -122.08549)),
};
Future<Position> _determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    return Future.error(Strings.locationServicesAreDisabled);
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error(Strings.locationPermissionDenied);
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(Strings.locationPermissionDeniedPermanently);
  }
  return await Geolocator.getCurrentPosition();
}

class _HomeMapState extends State<HomeMap> {
  GoogleMapController? _googleMapController;
  final CameraPosition _initialCameraPosition = const CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  moveToCurrentLocation() async {
    Position position = await _determinePosition();
    setState(() {
      _googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.4746,
      )));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GoogleMap(
          myLocationButtonEnabled: true,
          zoomControlsEnabled: true,
          initialCameraPosition: _initialCameraPosition,
          onMapCreated: (controller) => _googleMapController = controller,
          markers: _setMarker,
        ),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.location_pin),
          onPressed: () => moveToCurrentLocation(),
        ),
      ),
    );
  }
}
