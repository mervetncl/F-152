import 'package:flutter/material.dart';
import 'package:parket/core/models/park.dart';
import 'package:parket/ui/favorite/favori_view_model.dart';
import 'package:stacked/stacked.dart';

class FavoriView extends StatelessWidget {
  const FavoriView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<FavoriViewModel>.reactive(
        viewModelBuilder: () => FavoriViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text("Favorilerim"),
              ),
              body: model.favoured == null || model.favoured!.isEmpty
                  ? const Center(
                      child: Text("You have no Favourite Park"),
                    )
                  : Column(
                      children: [
                        Expanded(
                            child: ListView.builder(
                                itemCount: model.favoured!.length,
                                itemBuilder: (BuildContext context, int index) {
                                  var park = model.favoured!.getAt(index) as Park?;
                                  return ListTile(
                                    titleAlignment: ListTileTitleAlignment.center,
                                    trailing: IconButton(
                                      icon: model.favorite!.containsKey(park!.ad!)
                                          ? const Icon(Icons.favorite)
                                          : const Icon(Icons.favorite_border),
                                      onPressed: () {
                                        model.setFavourite(park);
                                      },),
                                    leading: const Icon(Icons.car_rental),
                                    title: Text(park!.ad!, style: const TextStyle(color: Colors.green, fontSize: 15),),
                                    subtitle: Row(
                                      children: [
                                        Text("Ücret : ${park.ucret} TL"),
                                        const Padding(padding: EdgeInsets.only(right: 10)),
                                        Text("Kapasite : ${park.kapasite}")
                                      ],
                                    ),
                                    minVerticalPadding: 15,
                                  );

                                })
                        )
                      ],
                    ),
            ));
  }
}
