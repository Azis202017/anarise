import 'package:get/get.dart';

import '../controllers/question_quiz_controller.dart';

class QuestionQuizBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<QuestionQuizController>(
      () => QuestionQuizController(),
    );
  }
}
