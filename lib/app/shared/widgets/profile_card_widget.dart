import 'package:anarise/app/shared/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

import '../theme/font.dart';

class ProfileCardWidget extends StatelessWidget {
  const ProfileCardWidget({
    super.key,
    required this.image,
    this.role,
    required this.nama,
  });
  final String? role;
  final String? image;
  final String? nama;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        image != null ? ProfileWidget(image: image) : const SizedBox(),
        const SizedBox(
          width: 8,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(nama ?? "", style: body2Bold),
            Text(nama != null ? '$role' : "",
                style: buttonLinkXSRegular),
          ],
        )
      ],
    );
  }
}
