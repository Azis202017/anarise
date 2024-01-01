import 'dart:async';

import 'package:anarise/app/shared/theme/font.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/welcome_screen_controller.dart';

class WelcomeScreenView extends GetView<WelcomeScreenController> {
  const WelcomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeScreenController>(initState: (state) {
      Timer.periodic(const Duration(seconds: 5), (timer) {
        Get.toNamed(Routes.ONBOARDING);
        timer.cancel();
      });
    }, builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('WelcomeScreenView'),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/img/logo.png',
              width: double.infinity,
            ),
            const SizedBox(height : 9,),

            Padding(
              padding: const EdgeInsets.only(
                left: 55.0,
                right: 61,
              ),
              child: Text(
                'Learning Adaptively, Resonating Values and Approaches',
                style: body2Bold.copyWith(color:const Color(0xff471069)),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height : 61,),
            Image.asset(
              'assets/img/halo.png',
              width: 282,
              height: 58,
            ),
            const SizedBox(height : 120,),

          ],
        ),
      );
    });
  }
}
