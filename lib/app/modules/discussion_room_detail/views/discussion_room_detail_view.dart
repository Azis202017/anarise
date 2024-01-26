import 'package:anarise/app/shared/widgets/custom_dialog_widget.dart';
import 'package:anarise/app/shared/widgets/discussion_room_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../shared/widgets/form_widget.dart';
import '../../../shared/widgets/header_widget.dart';
import '../controllers/discussion_room_detail_controller.dart';

class DiscussionRoomDetailView extends GetView<DiscussionRoomDetailController> {
  const DiscussionRoomDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscussionRoomDetailController>(initState: (_) {
      controller.fetchDiscussionDetail();
    }, builder: (_) {
      return Scaffold(
        appBar: const Header(
          title: 'Forum Diskusi',
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
              onRefresh: () async{
                controller.fetchDiscussionDetail();
              },
              child: SingleChildScrollView(
                  child: Column(
                    children: [
                      DiscussionRoomWidget(
                        title: '${controller.detailModel?.title}',
                        description: '${controller.detailModel?.content}',
                        nama: '${controller.detailModel?.teacher?.fullname}',
                        role: 'Guru',
                        data: controller.detailModel!.replies!.length,
                        image: '${controller.detailModel!.teacher!.photoUrl}',
                        textButton: 'Balas',
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return CustomDialog(
                                  title: 'Beri Tanggapan',
                                  subtitle: 'Tulislah menurut pendapat mu',
                                  widget: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const SizedBox(height: 20),
                                      InputForm(
                                        controller: controller.pendapatController,
                                        hintText: 'Tulis pendapat',
                                        maxLines: 7,
                                        keyboardType: TextInputType.multiline,
                                      ),
                                      const SizedBox(height: 30),
                                      SizedBox(
                                        width: double.infinity,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 40,
                                              child: ElevatedButton(
                                                onPressed: controller
                                                    .postAnswerDiscussion,
                                                child: const Text('Kirimkan'),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 18),
                                    ],
                                  ),
                                );
                              });
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 24,
                        ),
                        child: Column(
                            children:
                                controller.detailModel!.replies!.map((data) {
                          return Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: DiscussionRoomWidget(
                                  image: '${data.student!.photoUrl}',
                                  nama: '${data.student!.fullname}',
                                  role: 'Murid',
                                  title: '${data.title}',
                                  description: '${data.content}',
                                ),
                              ),
                             data.teacherReply == null ? const SizedBox():  Padding(
                                padding: const EdgeInsets.only(top: 30.0),
                                child: DiscussionRoomWidget(
                                  image: '${controller.detailModel?.teacher?.photoUrl}',
                                  nama:
                                      '${controller.detailModel?.teacher?.fullname}',
                                  role: 'Guru',
                                  title: '${data.title}',
                                  description: '${data.teacherReply}',
            
                                ),
                              ),
                            ],
                          );
                        }).toList()),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
            ),
      );
    });
  }
}
