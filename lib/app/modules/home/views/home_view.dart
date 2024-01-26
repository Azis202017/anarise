import 'package:anarise/app/shared/theme/font.dart';
import 'package:anarise/app/shared/widgets/profile_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/header_widget.dart';
import '../../../shared/widgets/learn_ability_widget.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(initState: (_) {
      controller.userData();
      controller.fetchListMateri();
    }, builder: (_) {
      return SafeArea(
        child: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: Header(
                  subtitle: 'Selamat Datang',
                  title: '${controller.user?.student?.fullname}',
                  learnstyle:
                      controller.user?.student?.learningStyle?.name ?? "",
                  centerTitle: false,
                  actions: [
                    ProfileWidget(
                      image: controller.user?.student?.photoUrl,
                      width: 50,
                      height: 50,
                    ),
                  ],
                ),
                body: SafeArea(
                  child: RefreshIndicator(
                    onRefresh: () async {
                      controller.fetchListMateri();
                      controller.userData();
                    },
                    child: SingleChildScrollView(
                      physics: const AlwaysScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          LearnAbilityWidgets(
                            image:
                                'https://res.cloudinary.com/dkkga3pht/image/upload/v1686398308/fun-3d-illustration-doctor-with-vr-helmet_1_wtz5rb.png',
                            title:
                                'Sebelum memulai pembelajaran, Mari test gaya belajarmu',
                            onPressed: () {
                              Get.toNamed(Routes.LEARN_ABILITY_TEST,
                                  arguments: {
                                    'id': controller.user!.student!.id
                                  });
                            },
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 20, right: 20),
                            child: GridView.builder(
                                primary: false,
                                shrinkWrap: true,
                                gridDelegate:
                                    const SliverGridDelegateWithMaxCrossAxisExtent(
                                  maxCrossAxisExtent: 200,
                                  childAspectRatio: 5 / 8,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                ),
                                itemCount: controller.materi.length,
                                itemBuilder: (BuildContext ctx, index) {
                                  var data = controller.materi[index];
                                  return GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.DETAIL_COURSES,
                                          arguments: {
                                            'id': data.id,
                                            'user_id' : controller.user?.id,
                                          });
                                     
                                    },
                                    child: Card(
                                      shape: RoundedRectangleBorder(
                                        side: const BorderSide(
                                          width: 1,
                                          color: blueLight,
                                        ),
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      elevation: 0,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Image.network(
                                            data.fileUrl!,
                                            width: 165,
                                            height: 165,
                                            fit: BoxFit.cover,
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                              horizontal: 20,
                                              vertical: 20,
                                            ),
                                            child: Text(data.title!,
                                                style: body2Bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
      );
    });
  }
}
