import 'package:get/get.dart';

import '../controllers/isi_survey_controller.dart';

class IsiSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IsiSurveyController>(
      () => IsiSurveyController(),
    );
  }
}
