import 'package:get/get.dart';

import '../controllers/quiz_score_controller.dart';

class QuizScoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuizScoreController>(
      () => QuizScoreController(),
    );
  }
}
