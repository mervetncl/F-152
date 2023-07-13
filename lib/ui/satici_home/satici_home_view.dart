import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parket/app/app.router.dart';
import 'package:parket/common/helpers/create_bottom_navigation_bar_item.dart';
import 'package:parket/ui/satici_home/satici_home_view_model.dart';
import 'package:stacked/stacked.dart';

class SaticiHomeView extends StatelessWidget {
  const SaticiHomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SaticiHomeViewModel>.reactive(
        viewModelBuilder: () => SaticiHomeViewModel(),
        onViewModelReady: (model) => model.init(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text("Satıcı Panel"),
                // popup menu button
                actions: [
                  PopupMenuButton<int>(
                    itemBuilder: (context) => [
                      // popupmenu item 1
                      PopupMenuItem(
                        onTap: () async {
                          await model.signOut();
                          Navigator.pop(context);
                          model.navigationService.navigateTo(Routes.homeView);
                          Fluttertoast.showToast(
                              msg: "Çıkış Yapıldı",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.green,
                              textColor: Colors.white,
                              fontSize: 16.0);
                        },
                        value: 1,
                        // row has two child icon and text.
                        child: const Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(width: 10),
                            Text("Çıkış Yap")
                          ],
                        ),
                      ),
                    ],
                    offset: const Offset(0, 100),
                    color: Colors.grey,
                    elevation: 2,
                  ),
                ],
              ),
              body: getViewForIndex(model.currentIndex),
              bottomNavigationBar: BottomNavigationBar(
                elevation: 0,
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.blue,
                unselectedItemColor: Colors.grey,
                selectedFontSize: 13,
                unselectedFontSize: 13,
                items: [
                  createNavItem(TabItem.List),
                  createNavItem(TabItem.Add),
                ],
                onTap: (value) {
                  model.setTabIndex(value);
                },
                currentIndex: model.currentIndex,
              ),
            ));
  }
}
