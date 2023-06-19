import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:get/get.dart';

import '../../../data/model/material_model.dart';
import '../../../data/model/profile_user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/services/material_service.dart';
import '../../../shared/services/profile_user_service.dart';

class HomeController extends GetxController {
  ProfileUserModel? user;
  InAppWebView? webViewController;
  bool isLoading = true;
  List<MaterialModel> materi = [];
  @override
  void onReady() {
    userData();
    fetchListMateri();
    super.onReady();
  }

  void fetchListMateri() async {
    materi = await MaterialService().getAllMaterial();
    isLoading = false;
    update();
  }

  void userData() async {
    user = await ProfileUserService().getUserData();
    isLoading = false;
    update();
  }

  void goToLearnAbilityTest() {
    Get.toNamed(Routes.LEARN_ABILITY_TEST);
  }
  void goToCourseDetail() {
    
  }
}
