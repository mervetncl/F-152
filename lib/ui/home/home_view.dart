import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parket/ui/home/home_view_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:stacked/stacked.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  static const CameraPosition position = CameraPosition(
      target: LatLng(39.1509572,34.1197993), zoom: 14.4746);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => const Scaffold(
              body: GoogleMap(
                initialCameraPosition: position,
                mapType: MapType.normal,
              ),
            ));
  }
}
