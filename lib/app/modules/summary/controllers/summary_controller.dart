import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/summary_model.dart';
import '../../../shared/services/summary_service.dart';

class SummaryController extends GetxController {
  FlipCardController flipController = FlipCardController();
  List<SummaryModel> summary = [];
  String id = Get.arguments['id'];
  String title = Get.arguments['title'];

  @override
  void onInit() {
    fetchSummary();
    super.onInit();
  }

  int currentIndex = 0;
  int totalElements = 0;

  double get progress => currentIndex / totalElements;

  void setCurrentIndex(int index) {
    if(index > totalElements){
      return;
    }
    currentIndex = index;
    update();
  }

  void setTotalElements(int total) {
    totalElements = total;
    update();
  }

  SummaryModel? elementToTrack; //

  void skip() {
    // index = elements.length -1;
    // elementToTrack = elements[index];
    // totalElements = elements.length;
    // elementIndex = elements.indexOf(elementToTrack);
    // progress = elementIndex / (totalElements - 1);

    // update();
  }

  void fetchSummary() async {
    summary = await SummaryService().summaryModel(id: id);
    update();
  }
}
