import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_app.dart';
import '../theme/font.dart';

class CustomDialog extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final Widget? widget;
  const CustomDialog({
    super.key,
    this.title,
    this.subtitle,
    this.widget,
  });

  dialogContent(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            offset: Offset(0.0, 10.0),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment:
            CrossAxisAlignment.start, // To make the card compact
        children: <Widget>[
          const SizedBox(height: 30),
          Text(
            '$title',
            style: GoogleFonts.inter(
              fontSize: 17,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '$subtitle',
            style: tinyText.copyWith(
              fontSize: 12,
              color: greyColor3,
            ),
          ),
         widget!
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: dialogContent(context),
    );
  }
}
