import 'package:anarise/app/shared/theme/font.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/discussion_room_widget.dart';
import '../../../shared/widgets/header_widget.dart';
import '../controllers/discussion_room_controller.dart';

class DiscussionRoomView extends GetView<DiscussionRoomController> {
  const DiscussionRoomView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscussionRoomController>(initState: (_) {
      controller.fetchListDiscussion();
    }, builder: (_) {
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
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : controller.listDiscussion.isEmpty
                ? Center(
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Lottie.network(
                              'https://res.cloudinary.com/dkkga3pht/raw/upload/v1687060554/80356-online-learning_vhwqc7.json'),
                          const SizedBox(height: 20),
                          SizedBox(
                            width:double.infinity,
                            child: Text(
                              'Belum terdapat diskusi',
                              style: h1Bold,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: Text(
                              'Yah maaf diskusi masih belum ada nih dari guru nya , coba  melakukan refresh materi  menekan tombol dibawah ini',
                              style: bodyRegular,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () {
                              controller.fetchListDiscussion();
                            },
                            child: const Text('Coba refresh'),
                          ),
                        ],
                      ),
                    ),
                  )
                : RefreshIndicator(
                    onRefresh: () async {
                      controller.fetchListDiscussion();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: controller.listDiscussion.map((data) {
                            return Column(
                              children: [
                                const SizedBox(height: 30),
                                DiscussionRoomWidget(
                                  title: '${data.title}',
                                  role: "Guru",
                                  description: '${data.content}',
                                  onPressed: () {
                                    Get.toNamed(Routes.DISCUSSION_ROOM_DETAIL,
                                        arguments: {
                                          'id': data.id,
                                        });
                                  },
                                  textButton: 'Baca lebih lanjut',
                                ),
                                const SizedBox(height: 30),
                              ],
                            );
                          }).toList()
                          //  const SizedBox(
                          //   height: 30,
                          // ),
                          // Column(
                          //   children: [

                          //   ],
                          // ),

                          ),
                    ),
                  ),
      );
    });
  }
}
