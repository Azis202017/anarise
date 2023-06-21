import 'package:flip_card/flip_card_controller.dart';
import 'package:get/get.dart';

import '../../../data/model/summary_model.dart';
import '../../../shared/services/summary_service.dart';

class SummaryController extends GetxController {
  FlipCardController flipController = FlipCardController();
  List<SummaryModel> summary = [];

  @override
  void onInit() {
    fetchSummary();
    super.onInit();
  }

  int index = 0;
  SummaryModel? elementToTrack; //
  int totalElements = 0;
  int elementIndex = 0;
  double progress = 0;
  void skip() {
    // index = elements.length -1;
    // elementToTrack = elements[index];
    // totalElements = elements.length;
    // elementIndex = elements.indexOf(elementToTrack);
    // progress = elementIndex / (totalElements - 1);

    // update();
  }

  void next() {
    if (index < totalElements) {
      index++;
      update();
    } else if (index > totalElements) {
      return;
    }

    elementToTrack = summary[index];
    elementIndex = summary.indexOf(elementToTrack!);
    progress = elementIndex / (totalElements - 1);
    totalElements = summary.length - 1;

    update();
  }

  void back() {
    elementToTrack = summary[index];
    elementIndex = summary.indexOf(elementToTrack!);
    progress = elementIndex / (totalElements - 1);
    totalElements = summary.length - 1;

    if (index > 0) {
      index--;
      update();
    }
  }

  void fetchSummary() async {
    summary = await SummaryService().summaryModel();
    update();
  }
}
