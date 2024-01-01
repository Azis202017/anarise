import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../shared/theme/color_app.dart';
import '../../../shared/theme/font.dart';
import '../../../shared/widgets/header_widget.dart';
import '../../../shared/widgets/profile_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(initState: (_) {
      controller.userData();
    }, builder: (_) {
      return Scaffold(
        appBar: const Header(
          title: 'Profile Pengguna',
        ),
        body: controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : RefreshIndicator(
                onRefresh: () async {
                  controller.userData();
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                ProfileWidget(
                                  image: '${controller.user?.student?.photoUrl}',
                                  width: 75,
                                  height: 75,
                                ),
                                const SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.user?.student?.fullname}',
                                      style: bodyBold.copyWith(
                                        color: blackColor2,
                                      ),
                                    ),
                                    Text(
                                      '${controller.user?.student?.studentClass?.name}',
                                      style: body2Regular.copyWith(
                                        color: greyColor3,
                                      ),
                                    ),
                                    Text('${controller.user?.student?.learningStyle?.name}')
                                  ],
                                )
                              ],
                            ),
                            const Icon(Icons.edit_square),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Divider(
                          color: greyColor3,
                        ),
                        const Text('Account'),
                        const AccountMenuWidget(
                          leading: Icon(Icons.key, color: blueNormal),
                          text: 'Ganti Password',
                          color: blueNormal,
                        ),
                        AccountMenuWidget(
                          leading: const Icon(Icons.logout, color: Colors.red),
                          text: 'Logout',
                          color: Colors.red,
                          onTap: controller.logout,
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

class AccountMenuWidget extends StatelessWidget {
  final Widget? leading;
  final String? text;
  final Widget? trailing;
  final void Function()? onTap;
  final Color? color;
  const AccountMenuWidget(
      {super.key,
      this.text,
      this.leading,
      this.trailing,
      this.onTap,
      this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: leading,
      title: Text(
        '$text',
        style: GoogleFonts.inter(color: color),
      ),
      trailing: Icon(Icons.navigate_next, color: color),
      onTap: onTap,
    );
  }
}
