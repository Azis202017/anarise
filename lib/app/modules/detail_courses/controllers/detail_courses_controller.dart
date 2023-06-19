import 'package:get/get.dart';

import '../../../data/model/detail_materi_model.dart';
import '../../../shared/services/detail_materi_service.dart';

class DetailCoursesController extends GetxController {
  bool isLoading = true;
  String id = Get.arguments['id'];
  DetailMateriModel? detailMateri;
  @override
  void onInit() {
    super.onInit();
    fetchDetailMateri();
  }

  void fetchDetailMateri() async {
    detailMateri = await DetailMateriService().getDetailMateri(id: id);
    isLoading = false;
    update();
  }
}
