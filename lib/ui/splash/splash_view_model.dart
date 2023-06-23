import 'package:flutter/cupertino.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/app/app_base_view_model.dart';

class SplashViewModel extends AppBaseViewModel {
  init(BuildContext context) {
    Future<void>.delayed(const Duration(milliseconds: 2000), () {
      navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    });
  }
}
