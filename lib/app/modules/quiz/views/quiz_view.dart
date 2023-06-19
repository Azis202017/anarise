import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/header_widget.dart';
import '../../../shared/widgets/quiz_widget.dart';
import '../controllers/quiz_controller.dart';

class QuizView extends GetView<QuizController> {
  const QuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizController>(builder: (_) {
      return Scaffold(
        appBar:  Header(
          title: 'Halaman Quiz',
          leading: SizedBox(
            width: 40,
            height: 40,
            child: GestureDetector(
              child: const ImageIcon(
                NetworkImage(
                  'https://res.cloudinary.com/dkkga3pht/image/upload/v1686495248/Frame_99_2_gcpvpe.png',
                ),
                color: blueNormal,
              ),
              onTap: () {
                Get.back();
              },
            ),
          ),
          
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 60,
                    ),
                    Column(
                        children: controller.quiz.map((data) {
                      return GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.QUIZ_DETAIL,
                              arguments: {'id': data.id});
                        },
                        child: QuizCardWidget(
                          image:
                              'https://res.cloudinary.com/dkkga3pht/image/upload/v1686323666/Isolation_Mode_wxgpoz.png',
                          title: '${data.type}',
                          description: '${data.description}',
                        ),
                      );
                    }).toList()),
                  ],
                ),
              ),
      );
    });
  }
}
