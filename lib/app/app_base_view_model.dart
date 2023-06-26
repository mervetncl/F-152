import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:parket/core/di/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class AppBaseViewModel extends BaseViewModel{
  NavigationService navigationService = getIt.get<NavigationService>();
  initialise(){
  }

}