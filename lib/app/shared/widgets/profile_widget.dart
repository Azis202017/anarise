import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({
    super.key,
    required this.image,
    this.width = 40,
    this.height = 40,
  });

  final String? image;
  final double? width, height;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage('$image'),
            fit: BoxFit.cover,
          ),
        ));
  }
}
