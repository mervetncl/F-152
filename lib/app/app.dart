import 'package:parket/ui/credit/credit_card_view.dart';
import 'package:parket/ui/favorite/favori_view.dart';
import 'package:parket/ui/home/home_view.dart';
import 'package:parket/ui/login/signin_view.dart';
import 'package:parket/ui/satici_home/satici_home_view.dart';
import 'package:parket/ui/signup/signup_view.dart';
import 'package:parket/ui/splash/splash_view.dart';
import 'package:parket/ui/thankyou/thankyou_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: CreditCardPage),
  MaterialRoute(page: SignInView),
  MaterialRoute(page: SignUpView),
  MaterialRoute(page: SaticiHomeView),
  MaterialRoute(page: ThankYouPage),
  MaterialRoute(page: FavoriView),
])
class App {}
