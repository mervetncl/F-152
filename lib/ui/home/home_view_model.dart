import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:parket/core/models/otopark.dart';
import 'package:parket/core/models/park.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomeViewModel extends AppBaseViewModel {
  final panelController = PanelController();
  Set<Marker> markers = <Marker>{};
  Position? currentPosition;
  String? postakodu;
  late GoogleMapController mapController;
  Otopark? otopark;

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  final CameraPosition kGoogle =
      const CameraPosition(target: LatLng(39.9029099, 32.4331094), zoom: 7);

  Future<void> init() async {
    try{
      await Hive.openBox('favoured');
      repository.setFavouredMeals(Hive.box('favoured'));
      notifyListeners();
    }catch(e){
      print(e);
    }

  }
  setFavourite(Otopark otopark)  {
    if (favorite!.containsKey(otopark.ad)) {
      favorite!.delete(otopark.ad);
    } else {
      Park park = Park();
      park.ad = otopark.ad;
      park.ucret = otopark.ucret;
      park.kapasite = otopark.kapasite;

      favorite!.put(otopark.ad, park);
      repository.setFavouredMeals(favorite!);
    }
    notifyListeners();
  }

  Future<Otopark?> getParkSpaces() async {
    markers = {};
    var querySnapshot = await FirebaseFirestore.instance
        .collection('otoparklar')
        .where("postaKodu", isEqualTo: postakodu)
        .get();

    var map = querySnapshot.docs.map((e) => Otopark.fromSnapshot(e));

    for (var element in map) {
      markers.add(Marker(
          markerId: MarkerId(element.ad),
          icon: BitmapDescriptor.defaultMarker,
          position: LatLng(
              double.parse(element.latitude), double.parse(element.longitude)),
          infoWindow: InfoWindow(title: "${element.ucret} TL"),
          onTap: () {
            otopark = element;
            notifyListeners();
            panelController.open();
            notifyListeners();
          }));
    }
    notifyListeners();
    return null;
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
      await placemarkFromCoordinates(value.latitude, value.longitude)
          .then((List<Placemark> placemarks) {
        Placemark place = placemarks[0];
        postakodu = '${place.postalCode}';
      });
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


}
