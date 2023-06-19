import 'package:get/get.dart';

import '../controllers/discussion_room_controller.dart';

class DiscussionRoomBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DiscussionRoomController>(
      () => DiscussionRoomController(),
    );
  }
}
