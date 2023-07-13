import 'package:flutter/material.dart';
import 'package:parket/common/widgets/tab_widget.dart';
import 'package:parket/core/models/otopark.dart';
import 'package:parket/ui/home/home_view.dart';

Widget buildSlidingPanel(Otopark otopark) {
  return DefaultTabController(
    length: 1,
    child: Scaffold(
      appBar: buildTabBar(),
      body: TabWidget(otopark),
    ),
  );
}

PreferredSizeWidget buildTabBar() => PreferredSize(
      preferredSize: const Size.fromHeight(kTextTabBarHeight - 25),
      child: AppBar(
        title: buildDragIcon(), //Icon(Icons.drag_handle),
        centerTitle: true,
      ),
    );


Widget buildDragIcon() => Container(
      width: 40,
      height: 8,
      decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8)),
    );
