import 'package:anarise/app/routes/app_pages.dart';
import 'package:get/get.dart';

import '../../../data/model/quiz_detail_model.dart';
import '../../../shared/services/quiz_detail_service.dart';

class QuizDetailController extends GetxController {
  String id = Get.arguments['id'];
  bool isLoading = true;
  QuizDetailModel? quizDetailModel;
  @override
  void onInit() {
    fetchDetailQuiz();
    super.onInit();
  }
  void fetchDetailQuiz()async{
    quizDetailModel = await QuizDetailService().fetchQuestion(id: id);
    isLoading = false;
    update();
  }
  
}
