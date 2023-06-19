import 'package:get/get.dart';

import '../controllers/learn_ability_test_controller.dart';

class LearnAbilityTestBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LearnAbilityTestController>(
      () => LearnAbilityTestController(),
    );
  }
}
