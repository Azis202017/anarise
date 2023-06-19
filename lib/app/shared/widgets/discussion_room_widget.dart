import 'package:anarise/app/shared/widgets/profile_card_widget.dart';
import 'package:flutter/material.dart';

import '../theme/color_app.dart';
import '../theme/font.dart';

class DiscussionRoomWidget extends StatelessWidget {
  final String title;
  final String description;
  final String? image;
  final String? nama;
  final String? role;
  final String? textButton;
  final int data;
  final void Function()? onPressed;
  const DiscussionRoomWidget(
      {super.key,
      this.image,
      required this.title,
      required this.description,
      this.nama,
      this.onPressed,
      this.textButton,
      this.role,
      this.data = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      padding: const EdgeInsets.only(
        left: 20,
        right: 18,
        top: 20,
        bottom: 20,
      ),
      decoration: (role == "Guru" && data >= 1)
          ? const BoxDecoration(
              color: greyColor4,
              border: Border(
                left: BorderSide(color: blueDarker, width: 2),
              ))
          :role == "Guru" ?   const BoxDecoration(
              color: blueLight,
            ) : const BoxDecoration(
              color: blueCard,
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProfileCardWidget(
            image: image,
            nama: nama,
            role: role,
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            title,
            style: body2Bold,
          ),
          const SizedBox(height: 16),
          Text(
            style: tinyText.copyWith(
              fontSize: 12,
              height: 2,
              color: greyColor3,
            ),
            description,
          ),
          const SizedBox(height: 16),
          role == "Guru"
              ? SizedBox(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      SizedBox(
                        height: 47,
                        child: ElevatedButton(
                          onPressed: onPressed,
                          child: Text(textButton ?? ""),
                        ),
                      ),
                    ],
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
