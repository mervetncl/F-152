import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/app/app_base_view_model.dart';
import 'package:stacked/stacked.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AppBaseViewModel>.reactive(
        viewModelBuilder: () => AppBaseViewModel(),
        builder: (context, model, child) => Drawer(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    buildHeader(context),
                    buildMenuItems(context, model)
                  ],
                ),
              ),
            ));
  }

  Widget buildHeader(BuildContext context) => Container(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      );

  Widget buildMenuItems(BuildContext context, AppBaseViewModel model) =>
      Container(
        padding: const EdgeInsets.all(24),
        child: Wrap(
          runSpacing: 16,
          children: [
            ListTile(
              leading: const Icon(Icons.location_on),
              title: const Text("Favori İlanlarım"),
              onTap: () {},
            ),
            ListTile(
              leading: const Icon(Icons.login),
              title: const Text("Satıcı Girişi"),
              onTap: () async {
                Navigator.pop(context);
                var currentUser = await FirebaseAuth.instance.currentUser;
                if (currentUser != null) {
                  model.navigationService.navigateTo(Routes.saticiHomeView);
                } else {
                  model.navigationService.navigateTo(Routes.signInView);
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.app_registration),
              title: const Text("Satıcı Ol"),
              onTap: () {
                Navigator.pop(context);
                model.navigationService.navigateTo(Routes.signUpView);
              },
            ),
          ],
        ),
      );
}
