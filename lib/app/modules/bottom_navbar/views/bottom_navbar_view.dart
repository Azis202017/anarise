import 'package:anarise/app/modules/home/controllers/home_controller.dart';
import 'package:anarise/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bottom_navbar_controller.dart';

class BottomNavbarView extends GetView<BottomNavbarController> {
  const BottomNavbarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    Get.put(ProfileController());

    return GetBuilder<BottomNavbarController>(builder: (context) {
      return Scaffold(
        body: controller.page.elementAt(controller.selectedIndex),
        bottomNavigationBar: Container(
            height: 96,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(15), topLeft: Radius.circular(15)),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2,
                  color: Color.fromRGBO(
                    184,
                    184,
                    210,
                    0.5,
                  ),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: BottomNavigationBar(
                backgroundColor: Colors.white,
                type: BottomNavigationBarType.fixed,
                items: const <BottomNavigationBarItem>[
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      NetworkImage(
                          'https://res.cloudinary.com/dkkga3pht/image/upload/v1680442695/on_xh4yuq.png'),
                    ),
                    label: 'Beranda',
                    tooltip: 'Home',
                  ),
                  BottomNavigationBarItem(
                    icon: ImageIcon(
                      NetworkImage(
                          'https://res.cloudinary.com/dkkga3pht/image/upload/v1680446906/off_unrbxb.png'),
                    ),
                    label: 'Akun',
                    tooltip: 'Akun',
                  ),
                ],
                currentIndex: controller.selectedIndex,
                elevation: 0,
                onTap: controller.onItemTapped,
              ),
            )),
      );
    });
  }
}
