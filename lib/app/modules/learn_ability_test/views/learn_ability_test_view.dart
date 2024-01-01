import 'package:anarise/app/shared/theme/font.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'package:get/get.dart';

import '../../../shared/theme/color_app.dart';
import '../controllers/learn_ability_test_controller.dart';

class LearnAbilityTestView extends GetView<LearnAbilityTestController> {
  const LearnAbilityTestView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios,
              color: blueNormal,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Gaya Belajar Test',
          style: h4Bold.copyWith(
            color: blueNormal,
          ),
        ),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse(
              'https://larvaacademy.id/learning-style-test/${controller.id}'),
        ),
      ),
    );
  }
}
