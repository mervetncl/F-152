import 'package:flutter/material.dart';
import 'package:parket/ui/addotopark/otopark_view.dart';
import 'package:parket/ui/list/list_view.dart';

BottomNavigationBarItem createNavItem(TabItem tapItem) {
  var curentTab = TapItemData.tabs[tapItem]!;
  return BottomNavigationBarItem(icon: curentTab.icon, label: curentTab.title);
}

// ignore: constant_identifier_names
enum TabItem { List, Add }

class TapItemData {
  Widget icon;
  String title;

  TapItemData({required this.icon, required this.title});

  static Map<TabItem, TapItemData> tabs = {
    TabItem.List: TapItemData(icon: const Icon(Icons.list), title: "Otoparklarım"),
    TabItem.Add: TapItemData(icon: const Icon(Icons.add), title: "Otopark Ekle"),
  };
}

Widget getViewForIndex(int index) {
  switch (index) {
    case 0:
      return const OtoparkListView();
    case 1:
      return  OtoparkView();
    default:
      return const OtoparkListView();
  }
}
