import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_app.dart';
import '../theme/font.dart';

class LearnAbilityWidgets extends StatelessWidget {
  final String image;
  final String? title;
  final String? description;
  final void Function()? onPressed;
  const LearnAbilityWidgets({
    super.key,
    required this.image,
    this.title,
    this.description,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
        ),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://res.cloudinary.com/dkkga3pht/image/upload/v1686397672/Group_12_kxxu93.png',
            ),
          ),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: Text(
                      'Sebelum memulai pembelajaran, Mari test gaya belajarmu',
                      style: GoogleFonts.inter(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      top: 8,
                    ),
                    height: 26,
                    child: ElevatedButton(
                      onPressed: onPressed,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: blueLight,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Test Gaya Belajar',
                        style: tinyText.copyWith(
                          color: blueNormal,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Image.network(
              image,
              width: 175,
              fit: BoxFit.fill,
            ),
          ],
        ));
  }
}
