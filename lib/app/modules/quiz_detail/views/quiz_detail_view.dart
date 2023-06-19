import 'package:anarise/app/shared/theme/color_app.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/font.dart';
import '../../../shared/widgets/custom_dialog_widget.dart';
import '../controllers/quiz_detail_controller.dart';

class QuizDetailView extends GetView<QuizDetailController> {
  const QuizDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuizDetailController>(builder: (_) {
      return SafeArea(
        child: Scaffold(
          backgroundColor: blueNormal,
          body: controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 40.5,
                        ),
                        Center(
                          child: Image.network(
                            '${controller.quizDetailModel?.material?.fileUrl}',
                            height: 171,
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          '${controller.quizDetailModel?.type}',
                          style: smallText.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          '${controller.quizDetailModel?.material?.title}',
                          style: title3.copyWith(
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Apakah anda merasa percaya diri? apakah Anda akan menantang salah satu pertanyaan mengenai materi jantung kami yang paling telah di sediakan ?',
                          style: textTitle.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
          bottomNavigationBar: Container(
            width: double.infinity,
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 77,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: blueLight,
              ),
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return CustomDialog(
                        title: 'Apakah sudah siap mengerjakan ${controller.quizDetailModel!.type}?',
                        subtitle:
                            'Kalau sudah siap silahkan menekan tombol kerjakan kuis untuk mengerjakan kuis, kuis ini memakan waktu 15 menit',
                        widget: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  const SizedBox(height: 20),
                                  SizedBox(
                                    height: 40,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        Get.toNamed(Routes.QUESTION_QUIZ,
                                            arguments: {
                                              'id' : controller.quizDetailModel!.id
                                            },);
                                      },
                                      child:  Text(' kerjakan  ${controller.quizDetailModel!.type}'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 18),
                          ],
                        ),
                      );
                    });
              },
              child: Text(
                'Kerjakan Quiz',
                style: smallText.copyWith(
                  color: blueNormal,
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
