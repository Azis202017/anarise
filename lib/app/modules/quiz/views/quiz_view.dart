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
        appBar: Header(
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
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 15),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed(Routes.QUIZ_DETAIL, arguments: {
                                  'id': data.id,
                                });
                              },
                              child: QuizCardWidget(
                                image: controller.foto,
                                title: '${data.type}',
                                description: '${data.description}',
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        );
                      }).toList(),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 15),
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(Routes.ISI_SURVEY, arguments: {
                              'id': controller.userId,
                            });
                          },
                          child: const SurveyCardWidget(
                            image: 'assets/img/illustrasi_isi.png',
                            title: 'Isi Survey',
                            description:
                                'Silahkan isi survey berikut. Penilaian kamu sangat membantu dalam hasil kegiatan kami',
                          ),
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ],
                ),
              ),
      );
    });
  }
}
