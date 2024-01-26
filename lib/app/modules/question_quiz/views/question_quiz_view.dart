import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/model/question_model.dart';
import '../../../shared/widgets/header_widget.dart';
import '../../../shared/widgets/next_widget.dart';
import '../../../shared/widgets/question_widget.dart';
import '../controllers/question_quiz_controller.dart';

class QuestionQuizView extends GetView<QuestionQuizController> {
  const QuestionQuizView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<QuestionQuizController>(initState: (_) {
      controller.fetchQuestion();
    }, builder: (_) {
      QuestionModel? currentQuestion = controller.question.isEmpty
          ? null
          : controller.question[controller.index];

      return controller.isLoading && controller.question.isEmpty
          ? const Material(child: Center(child: CircularProgressIndicator()))
          : Scaffold(
              appBar: Header(
                title:
                    '${controller.minutes.toString().padLeft(2, '0')}:${controller.seconds.toString().padLeft(2, '0')}',
              ),
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  QuestionWidget(
                    indx: controller.index,
                    totalQuestions: controller.question.length,
                    question: controller.question[controller.index].question,
                  ),
                  ListTile(
                    title: Text(
                        '${controller.question[controller.index].optionA}'),
                    leading: Radio<String>(
                        value: 'A',
                        groupValue: '${currentQuestion!.selectedAnswer}',
                        onChanged: controller.onChanged),
                  ),
                  ListTile(
                    title: Text(
                        '${controller.question[controller.index].optionB}'),
                    leading: Radio<String>(
                      value: 'B',
                      groupValue: '${currentQuestion.selectedAnswer}',
                      onChanged: controller.onChanged,
                    ),
                  ),
                  ListTile(
                    title: Text(
                        '${controller.question[controller.index].optionC}'),
                    leading: Radio<String>(
                      value: 'C',
                      groupValue: '${currentQuestion.selectedAnswer}',
                      onChanged: controller.onChanged,
                    ),
                  ),
                  ListTile(
                    title: Text(
                        '${controller.question[controller.index].optionD}'),
                    leading: Radio<String>(
                      value: 'D',
                      groupValue: '${currentQuestion.selectedAnswer}',
                      onChanged: controller.onChanged,
                    ),
                  ),
                ],
              ),
              floatingActionButton: NextButton(
                nextQuestion: controller.nextQuestion,
                index: controller.index,
              ),
            );
    });
  }
}
