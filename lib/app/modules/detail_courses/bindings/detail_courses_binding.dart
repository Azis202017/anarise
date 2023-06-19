import 'package:get/get.dart';

import '../controllers/detail_courses_controller.dart';

class DetailCoursesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailCoursesController>(
      () => DetailCoursesController(),
    );
  }
}
