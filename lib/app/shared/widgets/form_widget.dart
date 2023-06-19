import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final bool? isPassword;
  final Widget? suffixIcon;
  final String? hintText;
  final TextInputType? keyboardType;
  final int? maxLines;
  const InputForm({
    super.key,
    this.validator,
    this.controller,
    this.isPassword = false,
    this.suffixIcon,
    this.hintText,
    this.keyboardType,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      autocorrect: false,
      validator: validator,
      controller: controller,
      obscureText: isPassword != false ? true : false,
      decoration: InputDecoration(
        hintText: hintText,
        suffixIcon: suffixIcon,

      ),
      maxLines: maxLines,
      keyboardType: keyboardType,
    );
  }
}