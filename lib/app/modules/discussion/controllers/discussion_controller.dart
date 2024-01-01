import 'package:anarise/app/routes/app_pages.dart';
import 'package:get/get.dart';

class DiscussionController extends GetxController {
  String title = Get.arguments['title'];
  String id = Get.arguments['id'];

  String image = Get.arguments['image'];
  void toDiscussionRoomView() {
    Get.toNamed(Routes.DISCUSSION_ROOM, arguments: {
      'id': id,
    });
  }
}
