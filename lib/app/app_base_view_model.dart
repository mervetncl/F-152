import 'package:firebase_auth/firebase_auth.dart';
import 'package:parket/core/di/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'app.router.dart';

class AppBaseViewModel extends BaseViewModel{
  NavigationService navigationService = getIt.get<NavigationService>();
  initialise(){
  }


}