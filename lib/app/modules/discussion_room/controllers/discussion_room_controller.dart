import 'package:get/get.dart';

import '../../../data/model/discussion_model.dart';
import '../../../shared/services/discussion_service.dart';

class DiscussionRoomController extends GetxController {
  List<DiscussionModel> listDiscussion = [];
  bool isLoading = true;
  @override
  void onInit() {
    // TODO: implement onInit
    fetchListDiscussion();
    super.onInit();
  }

  void fetchListDiscussion() async {
    listDiscussion = await DiscussionService().fetchDiscussionData();
    print(listDiscussion);
    isLoading = false;
    update();
  }
  

  
}
