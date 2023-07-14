import 'package:flutter/material.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/core/models/otopark.dart';
import 'package:parket/ui/home/home_view_model.dart';
import 'package:stacked/stacked.dart';

class TabWidget extends StatefulWidget {
  const TabWidget(this.otopark, {Key? key}) : super(key: key);
  final Otopark otopark;

  @override
  State<TabWidget> createState() => _TabWidgetState();
}
class _TabWidgetState extends State<TabWidget> {
  List<int> items = [1, 2, 3, 4, 5];
  int selectedItem = 1;

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<HomeViewModel>.reactive(
        viewModelBuilder: () => HomeViewModel(),
        builder: (context, model, child) => ListView(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.311,
                      child: widget.otopark.fotoUrl.isEmpty
                          ? const Center(child: CircularProgressIndicator())
                          : Image.network(widget.otopark.fotoUrl),
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                    Text(
                      widget.otopark.ad,
                      style: const TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        DropdownButton<int>(
                          value: selectedItem,
                          items: items
                              .map((item) => DropdownMenuItem(
                                  value: item,
                                  child: Text(
                                    "${item.toString()} Saat",
                                    style: const TextStyle(fontSize: 18),
                                  )))
                              .toList(),
                          onChanged: (item) {
                            setState(() {
                              selectedItem = item!;
                            });
                          },
                        ),
                        Text(
                          "${selectedItem * int.parse(widget.otopark.ucret)} TL",
                          style: const TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 15)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        const Text(
                          "Mevcut Kapasite",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          widget.otopark.kapasite.toString(),
                          style: const TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    ElevatedButton(
                        onPressed: () {
                          double ucret =
                              selectedItem * double.parse(widget.otopark.ucret);
                          model.navigationService.navigateTo(
                              Routes.creditCardPage,
                              arguments: ucret);
                        },
                        child: const Text(
                          "Yerini Ayır",
                          style: TextStyle(color: Colors.white),
                        )),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                    ElevatedButton(
                        onPressed: () async {
                          try {
                            final awaliableMaps =
                                await MapLauncher.installedMaps;
                            await awaliableMaps.first.showMarker(
                                coords: Coords(
                                    double.parse(widget.otopark.latitude),
                                    double.parse(widget.otopark.longitude)),
                                title: widget.otopark.ad);
                          } catch (e) {
                            print(e);
                          }
                        },
                        child: const Text(
                          "Yol Tarifi",
                          style: TextStyle(color: Colors.white),
                        )),
                    IconButton(
                        onPressed: () {
                            model.setFavourite(widget.otopark);
                        },
                        icon:model.favorite!.containsKey(widget.otopark.ad)
                            ? const Icon(Icons.favorite)
                            : const Icon(Icons.favorite_border),
                      ),
                    const Padding(padding: EdgeInsets.only(bottom: 10)),
                  ],
                ),
              ],
            ));
  }
}
