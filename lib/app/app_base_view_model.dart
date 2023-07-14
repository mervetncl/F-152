import 'package:hive_flutter/hive_flutter.dart';
import 'package:parket/core/di/get_it.dart';
import 'package:parket/core/repository/repository.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBaseViewModel extends BaseViewModel{
  NavigationService navigationService = getIt.get<NavigationService>();
  Repository repository = getIt.get<Repository>();

  initialise(){
    openHive();
  }
  Box? get favorite => repository.favouredMealsBox;


  Future openHive() async {
    await Hive.openBox('favoured');
  }

  @override
  Future<void> dispose() async {
    if (Hive.box('favoured').isOpen) Hive.box('favoured').compact();
    super.dispose();
  }



}