import 'package:anarise/app/shared/theme/color_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/widgets/discussion_card_widget.dart';
import '../../../shared/widgets/header_widget.dart';
import '../controllers/discussion_controller.dart';

class DiscussionView extends GetView<DiscussionController> {
  const DiscussionView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Header(
        title: 'Forum Diskusi',
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DiscussionCardWidget(
                image:
                    controller.image,
                description: 'Form diskusi pembahasan ${controller.title}',
                title: controller.title,
                onPressed: controller.toDiscussionRoomView,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
