import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parket/ui/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
      viewModelBuilder: () => HomeViewModel(),
      onViewModelReady: (model) => model.init(),
      builder: (context, model, child) => Scaffold(
        appBar: AppBar(
          title: const Text("ParkEt"),
        ),
        body: SafeArea(
          child: GoogleMap(
            onMapCreated: model.onMapCreated,
            initialCameraPosition: model.kGoogle,
            mapType: MapType.normal,
            markers: Set<Marker>.of(model.markers),
            zoomControlsEnabled: false,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
          ),
        ),
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 50),
          child: FloatingActionButton(
            onPressed: () async {
              await model.initLoc();
              model.getParkSpaces();
            },
            child: const Icon(Icons.my_location_sharp),
          ),
        ),
      ),
    );
  }
}
