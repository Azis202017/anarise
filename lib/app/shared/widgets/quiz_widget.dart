import 'package:flutter/material.dart';

import '../theme/font.dart';

class QuizCardWidget extends StatelessWidget {
  final String image;
  final String? title;
  final String? description;
  final void Function()? onPressed;
  const QuizCardWidget({
    super.key,
    required this.image,
    this.title,
    this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img/background.png',
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left:30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "",
                    style: h2Bold.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 9),
                  SizedBox(
                    width: 150,
                    child: Text(
                      description ?? "",
                      style: tinyText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                 
                ],
              ),
            ),
         
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Image.network(
                image,
                width: 110.06,
                height: 141,
                fit: BoxFit.cover,
              ),
            ),
            
          ],
        ));
  }
}



class SurveyCardWidget extends StatelessWidget {
  final String image;
  final String? title;
  final String? description;
  final void Function()? onPressed;
  const SurveyCardWidget({
    super.key,
    required this.image,
    this.title,
    this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/img/background.png',
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                left:30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title ?? "",
                    style: h2Bold.copyWith(color: Colors.white),
                  ),
                  const SizedBox(height: 9),
                  SizedBox(
                    width: 150,
                    child: Text(
                      description ?? "",
                      style: tinyText.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                 
                ],
              ),
            ),
         
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Image.asset(
                image,
                width: 110.06,
                height: 141,
                fit: BoxFit.cover,
              ),
            ),
            
          ],
        ));
  }
}
