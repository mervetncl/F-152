import 'package:draggable_fab/draggable_fab.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parket/common/widgets/navigation_drawer.dart';
import 'package:parket/common/widgets/sliding.dart';
import 'package:parket/core/models/otopark.dart';
import 'package:parket/ui/home/home_view_model.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
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
                title: const Text("Park Et"),
              ),
              drawer: const NavigationDrawerWidget(),
              body: SlidingUpPanel(
                controller: model.panelController,
                minHeight: 0,
                maxHeight: MediaQuery.of(context).size.height * 0.75,
                backdropEnabled: true,
                backdropColor: Colors.transparent,
                panelBuilder: (_) => buildSlidingPanel(model.otopark ??
                    Otopark(
                        ad: "",
                        fotoUrl: "",
                        kapasite: 0,
                        latitude: "",
                        longitude: "",
                        saticiId: "",
                        ucret: "")),
                body: GoogleMap(
                  onMapCreated: model.onMapCreated,
                  initialCameraPosition: model.kGoogle,
                  mapType: MapType.normal,
                  markers: model.markers,
                  zoomControlsEnabled: false,
                  myLocationEnabled: true,
                  myLocationButtonEnabled: false,
                  trafficEnabled: true,

                ),
              ),
              floatingActionButton: Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: DraggableFab(
                  child: FloatingActionButton(
                    onPressed: () async {
                      await model.initLoc();
                      await model.getParkSpaces();
                    },
                    child: const Icon(Icons.my_location_sharp),
                  ),
                ),
              ),
            ));
  }
}
