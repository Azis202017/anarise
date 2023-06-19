import 'package:get/get.dart';

class OnboardingController extends GetxController {
 bool isLastPage = false;
 void onChange(int index) {
  if(index == 2) {
    isLastPage = true;
    update();
  }
 }
}
