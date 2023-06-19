
import 'package:flutter/material.dart';

import '../theme/color_app.dart';
import '../theme/font.dart';

class DiscussionCardWidget extends StatelessWidget {
  final String image;
  final String? title;
  final String? description;
  final void Function()? onPressed;
  const DiscussionCardWidget({
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
            image: NetworkImage(
              'https://res.cloudinary.com/dkkga3pht/image/upload/v1686321245/Group_39_rljqe3.png',
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30.0),
              child: Image.network(
                image,
                width: 110.06,
                height: 141,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 8.0,
                top: 4,
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
                  const SizedBox(height: 9),
                  SizedBox(
                    height: 26,
                    width: 97,
                    child: ElevatedButton(
                      onPressed:onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueLight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Lihat Diskusi',
                        style: tinyText.copyWith(
                          color: blueNormal,
                        ),
                      ),
                    ),
                  )
                
                ],
              ),
            )
          ],
        ));
  }
}
