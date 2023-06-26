import 'package:flutter/material.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:parket/core/di/get_it.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ParkEt extends StatelessWidget {
  const ParkEt({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppBaseViewModel>.reactive(
        viewModelBuilder: () => getIt.get<AppBaseViewModel>(),
        onViewModelReady: (viewModel) => viewModel.initialise(),
        builder: (context, viewModel, child) => MaterialApp(
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorObservers: [StackedService.routeObserver],
          title: "ParkEt",
          debugShowCheckedModeBanner: false,
        ));
  }
}
