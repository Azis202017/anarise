import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../data/model/detail_materi_model.dart';
import '../../../shared/services/detail_materi_service.dart';

class ArController extends GetxController  {
  InAppWebViewController? webViewController;
  String id = Get.arguments['id'];

  int index = 0;
  void materi() {
    index = 0;
    update();
  }

  void augmented() {
    index = 1;
    update();
  }

  void kinestetik() {
    index = 2;
    update();
  }

  bool isLoading = true;
  DetailMateriModel? detailMateri;
  @override
  void onInit() {
    super.onInit();
    fetchDetailMateri();
  }

  void fetchDetailMateri() async {
    detailMateri = await DetailMateriService()
        .getDetailMateri(id: id);
    isLoading = false;
    update();
  }
}
