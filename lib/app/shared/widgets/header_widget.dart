import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_app.dart';
import '../theme/font.dart';

class Header extends StatelessWidget with PreferredSizeWidget {
  final String title;
  final String? subtitle;
  final Widget? leading;
  final bool centerTitle;
  final List<Widget>? actions;
  const Header(
      {super.key,
      required this.title,
      this.subtitle,
      this.centerTitle = true,
      this.actions,
      this.leading});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 16,
      ),
      child: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            subtitle == null
                ? const SizedBox()
                : Text(
                    subtitle ?? "",
                    style: GoogleFonts.inter(
                      color: greyColor3,
                    ),
                  ),
            Text(
              title,
              style: h4Bold.copyWith(
                color: blueNormal,
              ),
            ),
          ],
        ),
        centerTitle: centerTitle,
        actions: actions,
        leading: leading,
      ),
    );
  }

  @override
  // 
  Size get preferredSize => const Size(double.infinity, 100);
}
