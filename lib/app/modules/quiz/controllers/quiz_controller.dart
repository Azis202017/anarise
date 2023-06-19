import 'package:get/get.dart';

import '../../../data/model/quiz_model.dart';
import '../../../shared/services/quiz_service.dart';

class QuizController extends GetxController {
  bool isLoading = true;
  List<QuizModel> quiz = [];
  @override
  void onInit() {
    // TODO: implement onInit
    fetchAllQuiz();
    super.onInit();
  }

  void fetchAllQuiz()async  {
    quiz = await QuizService().fetchQuestion();
    isLoading = false;
    update();
    print(quiz);
  }
}
