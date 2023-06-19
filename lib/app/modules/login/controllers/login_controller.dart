import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/services/login_service.dart';
import '../../../shared/theme/color_app.dart';

class LoginController extends GetxController {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void login() async {
    String username = usernameController.text;
    String password = passwordController.text;
    Get.snackbar(
      '',
      'Tunggu Sebentar ya sedang proses login ...',
      backgroundColor: blackColor2,
      showProgressIndicator: true,
      borderRadius: 0,
      colorText: Colors.white,
      margin: EdgeInsets.zero,
      snackPosition: SnackPosition.BOTTOM,
    );
    if (await LoginService()
        .loginUser(username: username, password: password)) {
      Get.back();
      Get.offAllNamed(Routes.BOTTOM_NAVBAR);
      Get.snackbar("Berhasil", "Login Berhasil",
          backgroundColor: Colors.green, colorText: Colors.white);
    } else {
      Get.snackbar("Gagal", "Login gagal, silahkan coba lagi",
          backgroundColor: Colors.red, colorText: Colors.white);
    }
  }
}
