import 'package:get/get.dart';

import '../../../data/model/discussion_model.dart';
import '../../../shared/services/discussion_service.dart';

class DiscussionRoomController extends GetxController {
  String id = Get.arguments['id'];
  
  List<DiscussionModel> listDiscussion = [];
  bool isLoading = true;
  @override
  void onInit() {
    fetchListDiscussion();
    super.onInit();
  }

  void fetchListDiscussion() async {
    listDiscussion = await DiscussionService().fetchDiscussionData(id: id);
    isLoading = false;
    update();
  }
  

  
}
