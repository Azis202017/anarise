import 'package:anarise/app/data/model/profile_user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/services/profile_user_service.dart';
import '../../../shared/theme/color_app.dart';

class ProfileController extends GetxController {
  ProfileUserModel? user;
  bool isLoading = true;
  @override
  void onReady() {
    userData();
    super.onReady();
  }

  void userData() async {
    user = await ProfileUserService().getUserData();
    isLoading = false;
    update();
  }

  void logout() async {
    Get.snackbar(
      '',
      'Tunggu sebentar ya sedang proses logout ...',
      backgroundColor: blackColor2,
      showProgressIndicator: true,
      borderRadius: 0,
      colorText: Colors.white,
      margin: EdgeInsets.zero,
      snackPosition: SnackPosition.BOTTOM,
    );
    Get.back();
    final GetStorage storage = GetStorage();
    bool logout = await ProfileUserService().logoutUser();

    if (logout) {
      Get.offAllNamed(Routes.LOGIN);
      Get.snackbar(
        "Berhasil",
        "Logout Berhasil",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      storage.remove('token');
    } else {
      Get.snackbar("Error", "Logout Gagal",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
