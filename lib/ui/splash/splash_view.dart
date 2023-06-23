import 'package:flutter/material.dart';
import 'package:parket/common/widgets/splash_widget.dart';
import 'package:parket/ui/splash/splash_view_model.dart';
import 'package:stacked/stacked.dart';
class SplashView extends StatelessWidget {
  const SplashView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
        viewModelBuilder: () => SplashViewModel(),
        onViewModelReady: (model) => model.init(context),
        builder: (context, model, widget) {
          return const Splash();
        });
  }
}
