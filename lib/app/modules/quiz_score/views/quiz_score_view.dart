import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/theme/font.dart';
import '../../../shared/widgets/header_widget.dart';
import '../controllers/quiz_score_controller.dart';

class QuizScoreView extends GetView<QuizScoreController> {
  const QuizScoreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Header(
        title: 'Hasil Akhir Kuis',
        centerTitle: true,
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          controller.fetchLeaderboardData();
        },
        child: GetBuilder<QuizScoreController>(initState: (_) {
          controller.fetchLeaderboardData();
        }, builder: (context) {
          return controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : RefreshIndicator(
                onRefresh: () async {
                   controller.fetchLeaderboardData();
                },
                child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Container(
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                    'https://res.cloudinary.com/dkkga3pht/image/upload/v1686498557/Frame_r66na0.png'),
                                fit: BoxFit.cover,
                              ),
                              color: blueNormal,
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                            ),
                            child: Column(
                              children: [
                                Center(
                                  child: Image.network(
                                    'https://res.cloudinary.com/dkkga3pht/image/upload/v1686498945/Frame_1_sgbqkz.png',
                                    height: 229,
                                  ),
                                ),
                                const SizedBox(height: 10),
                                Text(
                                  'Selamat Atas Pencapaiannya',
                                  style: GoogleFonts.inter(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Text(
                                  'Anda mendapatkan ${controller.score.score} skor kuis',
                                  style: GoogleFonts.inter(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Text('Leaderboard'),
                          Text(
                            'Kamu berada di peringkat : ${controller.searchStudentIdInLeaderboard(controller.leaderboard)}',
                          ),
                          Column(
                              children: controller.leaderboard.map((data) {
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                    leading:
                                        Image.network(data.student!.photoUrl!),
                                    contentPadding: EdgeInsets.zero,
                                    title:
                                        Text('nama : ${data.student?.fullname}'),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('nilai : ${data.score}'),
                                        Text('rank : ${data.rank}'),
                                      ],
                                    )),
                              ],
                            );
                          }).toList()),
                        ],
                      ),
                    ),
                  ),
              );
        }),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Row(
          children: [
            SizedBox(
              width: 253,
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routes.BOTTOM_NAVBAR);
                },
                child: const Text('Selesai'),
              ),
            ),
            const SizedBox(width: 17),
            OutlinedButton(
              onPressed: () {},
              child: const Icon(Icons.share),
            )
          ],
        ),
      ),
    );
  }
}

class AnswerAccuration extends StatelessWidget {
  final String? title;
  final String? subtitle;
  const AnswerAccuration({super.key, this.title, this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$title',
          style: body2Bold.copyWith(
            fontSize: 12,
            letterSpacing: 0.120,
            color: blueNormal,
          ),
        ),
        Text(
          '$subtitle',
          style: body2Regular.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.120,
            color: blueNormal,
          ),
        ),
      ],
    );
  }
}
