import 'package:flutter/material.dart';

import '../theme/font.dart';


class NextButton extends StatelessWidget {
  const NextButton(
      {super.key, this.nextQuestion, this.backQuestion, this.index});
  final int? index;
  final VoidCallback? nextQuestion;
  final VoidCallback? backQuestion;

  @override
  Widget build(BuildContext context) {
    return 
        GestureDetector(
          onTap: nextQuestion,
          child: Container(
            width: 150,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 10),
            margin: const EdgeInsets.symmetric(
            ),
            child: Center(
              child: Text(
                'Selanjutnya',
                textAlign: TextAlign.center,
                style: buttonLinkXSBold.copyWith(color: Colors.white),
              ),
            ),
          ),
        );
      
  }
}