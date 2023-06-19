import 'package:flutter/material.dart';

import '../theme/font.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget(
      {super.key, this.question, this.indx, this.totalQuestions});
  final String? question;
  final int? indx;
  final int? totalQuestions;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16,),
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height:20),
         
          Text(
            'Question ${indx! + 1} / $totalQuestions',
            style: bodyBold,
          ),
          const SizedBox(height:8),
          Text(
            '$question',
            style: body2Regular,

          )
        ],
      ),
    );
  }
}