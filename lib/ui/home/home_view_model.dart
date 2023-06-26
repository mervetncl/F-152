import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:geolocator/geolocator.dart';

class HomeViewModel extends AppBaseViewModel {
  final List<Marker> markers = <Marker>[];
  Position? currentPosition;
  late GoogleMapController mapController;
  final CameraPosition kGoogle = const CameraPosition(
    target: LatLng(39.9029099, 32.4331094),
    zoom: 7,
  );

  Future<void> init() async {}

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> initLoc() async {
    await getUserCurrentLocation().then((value) async {
      currentPosition = value;
      CameraPosition cameraPosition = CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 12,
      );
      mapController
          .animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
    });
  }

  Future<Position> getUserCurrentLocation() async {
    await Geolocator.requestPermission()
        .then((value) {})
        .onError((error, stackTrace) async {
      await Geolocator.requestPermission();
    });
    return await Geolocator.getCurrentPosition();
  }

  void getParkSpaces() {
    markers.add(const Marker(
      markerId: MarkerId("2"),
      position: LatLng(39.151758, 34.1452961),
      infoWindow: InfoWindow(
        title: 'My Current Location',
      ),
    ));
    notifyListeners();
  }
}
