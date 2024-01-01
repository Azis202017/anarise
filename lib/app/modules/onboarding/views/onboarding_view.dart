import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/theme/font.dart';
import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        clipBehavior: Clip.antiAlias,
        fit: StackFit.expand,
        children: [
          Image.network(
              'https://res.cloudinary.com/dkkga3pht/image/upload/v1686587647/Clip_path_group_zpnggc.png'),
          GetBuilder<OnboardingController>(builder: (_) {
            return IntroductionScreen(
              globalBackgroundColor: Colors.transparent,
              pages: [
                PageViewModel(
                  titleWidget: Text(
                    'Terdapat Fitur Kuis',
                    style: h3Bold.copyWith(
                      color: blueNormal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  bodyWidget: Text(
                    'Dengan mengerjakan quiz setelah belajar, kamu dapat menguji pengetahuan anatomi mu dengan mengerjakan quiiz yang telah kami sediakan',
                    textAlign: TextAlign.center,
                    style: bodyRegular.copyWith(color: greyColor),
                  ),
                  image: Image.network(
                      'https://res.cloudinary.com/dkkga3pht/image/upload/v1686587662/Group_1_ydspq8.png'),
                ),
                PageViewModel(
                  titleWidget: Text(
                    'Terdapat Fitur Forum Diskusi',
                    style: h3Bold.copyWith(
                      color: blueNormal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  bodyWidget: Text(
                    'Setelah belajar, dengan forum diskusi kamu bisa berdiskusi dengan guru mu mengenai hal yang tidak kamu pahami mengenai anatomi',
                    style: bodyRegular.copyWith(color: greyColor),
                    textAlign: TextAlign.center,
                  ),
                  image: Image.network(
                      'https://res.cloudinary.com/dkkga3pht/image/upload/v1686587733/Group_2_g72rhf.png'),
                ),
                PageViewModel(
                  titleWidget: Text(
                    'Belajar Menyenangkan',
                    style: h3Bold.copyWith(
                      color: blueNormal,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  bodyWidget: Text(
                    'Belajar menjadi menyenangkan dengan berbagai macam gaya belajar yang sudah disediakan, seperti visual, audio, dan kinestetik',
                    style: bodyRegular.copyWith(color: greyColor),
                    textAlign: TextAlign.center,
                  ),
                  image: Image.network(
                    'https://res.cloudinary.com/dkkga3pht/image/upload/v1686587729/Group_3_ag8cok.png',
                    fit: BoxFit.cover,
                  ),
                  footer: Center(
                    child: SizedBox(
                      width: 271,
                      height: 39,
                      child: ElevatedButton(
                        child: const Text('Ayooo Mulai'),
                        onPressed: () {
                          Get.offAllNamed(Routes.LOGIN);
                        },
                      ),
                    ),
                  ),
                ),
              ],
              showSkipButton: true,
              showDoneButton: true,
              showNextButton: true,
              onChange: controller.onChange,
              onDone: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              onSkip: () {
                Get.offAllNamed(Routes.LOGIN);
              },
              done: const Icon(
                Icons.login,
              ),
              skip: ElevatedButton(
                child: const Text('Lewati'),
                onPressed: () {
                  Get.offAllNamed(Routes.LOGIN);
                },
              ),
              bodyPadding: const EdgeInsets.only(top: 150),
              next: const Icon(
                Icons.arrow_forward,
              ),
              dotsDecorator: const DotsDecorator(
                color: Color(0xFFBDBDBD),
                activeColor: blueNormal,
              ),
              initialPage: 0,
            );
          }),
        ],
      ),
    );
  }
}
