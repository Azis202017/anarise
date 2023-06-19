
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/color_app.dart';

class InputHeader extends StatelessWidget {
  final String? text;
  const InputHeader({super.key, this.text});

  @override
  Widget build(BuildContext context) {
    return Text('$text',
        style: GoogleFonts.inter(
          color: blueNormal,
          fontSize: 17,
          fontWeight:FontWeight.w700
        ));
  }
}
