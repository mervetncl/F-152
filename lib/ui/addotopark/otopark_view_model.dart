import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:parket/ui/list/list_view.dart';
import 'package:uuid/uuid.dart';

class OtoparkViewModel extends AppBaseViewModel {
  String? imageDownloadUrl;
  TextEditingController? nameController;
  TextEditingController? capacityController;
  TextEditingController? feeController;
  TextEditingController? codeController;
  TextEditingController? latitudeController;
  TextEditingController? longitudeController;

  Map<String, dynamic> otopark = <String, dynamic>{};

  init() {
    nameController = TextEditingController();
    capacityController = TextEditingController();
    feeController = TextEditingController();
    codeController = TextEditingController();
    latitudeController = TextEditingController();
    longitudeController = TextEditingController();
  }

  getFromGallery() async {
    var pickImage = ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 1800, maxHeight: 1800);

    pickImage.then((value) async {
      var s = value!.path;
      if (s.isNotEmpty) {
        File file = File(s);
        const uuid = Uuid();
        var id = uuid.v4();
        final storageRef = FirebaseStorage.instance.ref();
        final imageRef = storageRef.child("parkImages/$id.jpg");
        try {
          await imageRef.putFile(file);
          imageDownloadUrl = await imageRef.getDownloadURL();
          Fluttertoast.showToast(
              msg: "Fotoğraf Yüklendi",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
        } catch (e) {
          Fluttertoast.showToast(
              msg: e.toString(),
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        }
      }
    });
  }

  save() async {
    if (imageDownloadUrl != "") {
      otopark["fotoUrl"] = imageDownloadUrl;
      otopark["saticiId"] = FirebaseAuth.instance.currentUser?.email;
      CollectionReference refrence =
          FirebaseFirestore.instance.collection("otoparklar");
      Future<void> addOtopark() {
        return refrence.add(otopark).then((value) {
          Fluttertoast.showToast(
              msg: "Otopark Eklendi",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.green,
              textColor: Colors.white,
              fontSize: 16.0);
          return const OtoparkListView();
        }).catchError((error) {
          Fluttertoast.showToast(
              msg: error,
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.CENTER,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16.0);
        });
      }

      await addOtopark();
      navigationService.navigateTo(Routes.homeView);
    }
  }
}
