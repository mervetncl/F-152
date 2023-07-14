import 'package:parket/app/app.router.dart';
import 'package:parket/app/app_base_view_model.dart';

class ThankYouViewModel extends AppBaseViewModel {
  init() {
    Future<void>.delayed(const Duration(milliseconds: 5000), () {
      navigationService.pushNamedAndRemoveUntil(Routes.homeView);
    });
  }
}
