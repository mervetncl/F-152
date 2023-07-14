import 'package:hive_flutter/hive_flutter.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:parket/core/models/park.dart';

class FavoriViewModel extends AppBaseViewModel{
  Box? get favoured => repository.favouredMealsBox;

  init() async {
    await Hive.openBox('favoured');
    repository.setFavouredMeals(Hive.box('favoured'));
    notifyListeners();
  }

  setFavourite(Park gelenPark)  {
    if (favorite!.containsKey(gelenPark.ad)) {
      favorite!.delete(gelenPark.ad);
    } else {
      Park park = Park();
      park.ad = gelenPark.ad;
      park.ucret = gelenPark.ucret;
      park.kapasite = gelenPark.kapasite;

      favorite!.put(gelenPark.ad, park);
      repository.setFavouredMeals(favorite!);
    }
    notifyListeners();
  }
}