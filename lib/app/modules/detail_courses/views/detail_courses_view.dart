import 'package:anarise/app/shared/theme/font.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:readmore/readmore.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/header_widget.dart';
import '../controllers/detail_courses_controller.dart';

class DetailCoursesView extends GetView<DetailCoursesController> {
  const DetailCoursesView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(DetailCoursesController());
    return GetBuilder<DetailCoursesController>(builder: (context) {
      return controller.isLoading
          ? const Material(
              child: Center(child: CircularProgressIndicator()),
            )
          : SafeArea(
              child: Scaffold(
                appBar: Header(
                  title: '${controller.detailMateri!.title}',
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
                body: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: 349,
                          child: Image.network(
                            controller.detailMateri!.fileUrl!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(height: 30),
                        Text(
                          '${controller.detailMateri!.title}',
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: blueNormal,
                          ),
                        ),
                        const SizedBox(height: 16),
                        ReadMoreText(
                          textAlign: TextAlign.justify,
                          '${controller.detailMateri!.description}',
                          trimCollapsedText: 'Baca Selengkapnya',
                          trimExpandedText: ' Tutup',
                          style: GoogleFonts.inter(
                            fontSize: 12,
                            color: greyColor3,
                          ),
                          trimLines: 3,
                          colorClickableText: blueNormal,
                          trimMode: TrimMode.Line,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          '${controller.detailMateri?.teacher?.fullname}',
                          style: body2Regular,
                        ),
                        const SizedBox(height: 30),
                        Text(
                          'Metode Belajar',
                          style: GoogleFonts.inter(
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                            color: blueNormal,
                          ),
                        ),
                        const SizedBox(height: 20),
                        ListMetode(
                          image:
                              'https://res.cloudinary.com/dkkga3pht/image/upload/v1686496078/Frame_160_wwwvvz.png',
                          title: 'Modul Materi Belajar',
                          subtitle:
                              '${controller.detailMateri!.videos!.length} Materi Video | AR view | Pembelajaran Kinestetik',
                          onTap: () {
                            Get.toNamed(Routes.AR, arguments: {
                              'id': controller.detailMateri!.id,
                              'urlAudio' : controller.detailMateri!.audioUrl 
                            });
                          },
                        ),
                        ListMetode(
                          image:
                              'https://res.cloudinary.com/dkkga3pht/image/upload/v1686496136/Frame_160_1_zfrdx0.png',
                          title: 'Quiz ',
                          subtitle:
                              '${controller.detailMateri!.quiz!.length} Soal Quiz',
                          onTap: () {
                            Get.toNamed(Routes.QUIZ, arguments: {
                              'id': controller.detailMateri!.id,
                            });
                          },
                        ),
                        ListMetode(
                          image:
                              'https://res.cloudinary.com/dkkga3pht/image/upload/v1686496131/Frame_160_2_ol2v0l.png',
                          title: 'Form Diskusi',
                          subtitle:
                              '${controller.detailMateri!.discussion!.length} Diskusi',
                          onTap: () {
                            Get.toNamed(Routes.DISCUSSION);
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}

class ListMetode extends StatelessWidget {
  final String image;
  final String title;
  final String subtitle;
  final void Function()? onTap;

  const ListMetode(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: EdgeInsets.zero,
      leading: Image.network(
        image,
        width: 47,
        height: 47,
      ),
      title: Text(
        title,
        style: GoogleFonts.inter(
          fontSize: 12,
          color: blueNormal,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: GoogleFonts.inter(
          fontSize: 10,
          color: greyColor3,
        ),
      ),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
