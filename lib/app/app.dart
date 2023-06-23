import 'package:parket/ui/home/home_view.dart';
import 'package:parket/ui/splash/splash_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: SplashView, initial: true),
  MaterialRoute(page: HomeView),
])
class App {}
