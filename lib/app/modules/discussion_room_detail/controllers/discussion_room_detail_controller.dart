import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/model/discussion_detail_model.dart';
import '../../../shared/services/discussion_service.dart';
import '../../../shared/theme/color_app.dart';

class DiscussionRoomDetailController extends GetxController {
  DiscussionDetailModel? detailModel;
  String id = Get.arguments['id'];

  TextEditingController pendapatController = TextEditingController();
  bool isLoading = true;
  @override
  void onInit() {
    fetchDiscussionDetail();
    super.onInit();
  }

  void fetchDiscussionDetail() async {
    detailModel = await DiscussionService().fetchDiscussionDetail(id);
    isLoading = false;
    update();
  }

  void postAnswerDiscussion() async {
    print(id);
    bool isReplySuccess = await DiscussionService().postAnswerDiscussion(
      discussionId: id,
      title: detailModel?.title ?? "student reply",
      content: pendapatController.text,
    );
    if (isReplySuccess) {
      Get.back();
      Get.snackbar('Balas diskusi berhasil',
          "Selamat balasan diskusi anda berhasil dilakukan",
          backgroundColor: Colors.green, colorText: Colors.white);
      fetchDiscussionDetail();
      pendapatController.text = "";
    } else {
      Get.back();

      Get.snackbar('Balas diskusi berhasil',
          "Selamat balasan diskusi anda berhasil dilakukan",
          backgroundColor: redColor, colorText: Colors.white);
    }
  }
}
