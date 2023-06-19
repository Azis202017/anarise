import 'package:anarise/app/modules/profile/views/profile_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';

class BottomNavbarController extends GetxController {
   int selectedIndex = 0;
  List<Widget> page = [
    const HomeView(),
    const ProfileView(),
  ];
  void onItemTapped(int index) {
    selectedIndex = index;
    update();
  }
}
