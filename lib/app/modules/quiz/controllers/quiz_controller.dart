import 'package:get/get.dart';

import '../../../data/model/quiz_model.dart';
import '../../../shared/services/quiz_service.dart';

class QuizController extends GetxController {
  bool isLoading = true;
  String id = Get.arguments['id'];
  String foto = Get.arguments['foto'];
  String? userId = Get.arguments['user_id'];


  List<QuizModel> quiz = [];
  @override
  void onInit() {
    fetchAllQuiz();
    super.onInit();
  }

  void fetchAllQuiz() async {
    quiz = await QuizService().fetchQuestion(id: id);
    isLoading = false;
    update();
  }

 
}
