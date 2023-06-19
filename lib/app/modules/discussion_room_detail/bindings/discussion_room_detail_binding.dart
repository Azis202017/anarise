import 'package:get/get.dart';

import '../controllers/discussion_room_detail_controller.dart';

class DiscussionRoomDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscussionRoomDetailController>(
      () => DiscussionRoomDetailController(),
    );
  }
}
