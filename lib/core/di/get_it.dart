import 'package:get_it/get_it.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:stacked_services/stacked_services.dart';

final GetIt getIt = GetIt.instance;

Future<void> setDI() async {
  getIt.registerLazySingleton<AppBaseViewModel>(() => AppBaseViewModel());
  getIt.registerLazySingleton<NavigationService>(() => NavigationService());
}