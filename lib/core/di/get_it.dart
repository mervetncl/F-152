

import 'package:get_it/get_it.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

GetIt getIt = GetIt.instance;

void setDI(){
  getIt.registerLazySingleton<AppBaseViewModel>(() => AppBaseViewModel());
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());

}