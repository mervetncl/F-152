import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:parket/core/models/otopark.dart';

class ListViewModel extends AppBaseViewModel {
  List<Otopark> myOtoparkSpaces = [];

  init() async {
    setBusy(true);
    await getParkSpace();
    setBusy(false);
    notifyListeners();
  }

   getParkSpace() async {
    var currentUser = FirebaseAuth.instance.currentUser?.email;
    var future = await FirebaseFirestore.instance
        .collection("otoparklar")
        .where("saticiId", isEqualTo: currentUser)
        .get();

    var map = future.docs.map((e) => Otopark.fromSnapshot(e));
    for (var element in map) {
      myOtoparkSpaces.add(element);
    }
  }
}
