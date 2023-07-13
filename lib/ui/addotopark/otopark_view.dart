import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parket/common/constants/colors.dart';
import 'package:parket/ui/addotopark/otopark_view_model.dart';
import 'package:stacked/stacked.dart';

class OtoparkView extends StatelessWidget {
  OtoparkView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<OtoparkViewModel>.reactive(
        viewModelBuilder: () => OtoparkViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => SafeArea(
                child: Scaffold(
              backgroundColor: bgColor,
              body: SingleChildScrollView(
                child: Center(
                  child: Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 300,
                          child: Column(
                            children: [
                              const SizedBox(height: 30.0),
                              const Text(
                                "Otopark Ekle",
                                textScaleFactor: 2,
                              ),
                              const Divider(
                                color: academyBlue,
                                thickness: 2,
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              TextFormField(
                                controller: model.nameController,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: const TextStyle(color: academyBlack),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.directions_car_filled),
                                  border: OutlineInputBorder(),
                                  labelText: 'Otopark Adı',
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return "Boş bırakılamaz";
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return "Null olamaz";
                                  }
                                },
                                onSaved: (value) {
                                  model.otopark["ad"] = value ?? "";
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: model.capacityController,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: const TextStyle(color: academyBlack),
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.reduce_capacity_rounded),
                                  border: OutlineInputBorder(),
                                  labelText: 'Kapasite',
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return "Boş bırakılamaz";
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return "Null olamaz";
                                  }
                                },
                                onSaved: (value) {
                                  model.otopark["kapasite"] =
                                      int.parse(value ?? "");
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: model.feeController,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: const TextStyle(color: academyBlack),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.payment),
                                  border: OutlineInputBorder(),
                                  labelText: 'Ücret',
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return "Boş bırakılamaz";
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return "Null olamaz";
                                  }
                                },
                                onSaved: (value) {
                                  model.otopark["ucret"] = value ?? "";
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: model.codeController,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: const TextStyle(color: academyBlack),
                                decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.local_post_office_outlined),
                                  border: OutlineInputBorder(),
                                  labelText: 'Posta Kodu',
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return "Boş bırakılamaz";
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return "Null olamaz";
                                  }
                                },
                                onSaved: (value) {
                                  model.otopark["postaKodu"] = value ?? "";
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: model.latitudeController,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: const TextStyle(color: academyBlack),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(),
                                  labelText: 'Latitude',
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return "Boş bırakılamaz";
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return "Null olamaz";
                                  }
                                },
                                onSaved: (value) {
                                  model.otopark["latitude"] = value ?? "";
                                },
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              TextFormField(
                                controller: model.longitudeController,
                                enableSuggestions: false,
                                autocorrect: false,
                                style: const TextStyle(color: academyBlack),
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.location_on),
                                  border: OutlineInputBorder(),
                                  labelText: 'Longitude',
                                ),
                                validator: (value) {
                                  if (value != null) {
                                    if (value.isEmpty) {
                                      return "Boş bırakılamaz";
                                    } else {
                                      return null;
                                    }
                                  } else {
                                    return "Null olamaz";
                                  }
                                },
                                onSaved: (value) {
                                  model.otopark["longitude"] = value ?? "";
                                },
                              ),
                              const SizedBox(
                                height: 10,
                              )
                            ],
                          ),
                        ),
                        TextButton(
                            onPressed: () async {
                              await model.getFromGallery();
                            },
                            child: const Text(
                              "Fotoğraf Ekle",
                              style: TextStyle(color: academyYellow),
                            )),
                        const SizedBox(height: 10.0),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                elevation: 0,
                                padding: const EdgeInsets.all(15),
                                shape: const StadiumBorder(),
                                backgroundColor: academyYellow),
                            onPressed: () async {
                              final icerikUygunMu =
                                  formKey.currentState?.validate();
                              if (icerikUygunMu == true) {
                                formKey.currentState?.save();
                                model.save();
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Alanları Doldurun",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 1,
                                    backgroundColor: Colors.red,
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            child: const Text(
                              "Kaydet",
                              style: TextStyle(color: academyBlack),
                            )),
                        const SizedBox(height: 15.0),
                      ],
                    ),
                  ),
                ),
              ),
            )));
  }
}
