import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/theme/font.dart';
import '../../../shared/widgets/form_widget.dart';
import '../../../shared/widgets/input_header_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(-0.5, -1.0),
              end: Alignment(0.5, 0.98),
              colors: [
                Color(0xFF3EAFF7),
                Color(0xFF4C9BCE),
                Color(0xFF7AB7DE),
              ],
              stops: [0.0, 0.3289, 0.9895],
              transform: GradientRotation(101.64 * 0.0174533),
            ),
            boxShadow: [
              BoxShadow(
                color: Color.fromRGBO(49, 106, 142, 0.2),
                offset: Offset(0, 1),
                blurRadius: 20,
              ),
            ],
          ),
          child: Stack(
            children: [
              Column(
                children: [
                  Image.network(
                    'https://res.cloudinary.com/dkkga3pht/image/upload/v1687128000/Frame_95_gi9ctj.png',
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 320),
                width: double.infinity,
                height: 440,
                decoration: const BoxDecoration(
                  color: greyColor4,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      40,
                    ),
                    topRight: Radius.circular(
                      40,
                    ),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 19,
                    ),
                    Center(
                      child: Text(
                        'Login to your account',
                        style: h3Bold.copyWith(
                          color: blueNormal,
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 400),
                padding: const EdgeInsets.only(
                  left: 30,
                  top: 30,
                  right: 30,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                      40,
                    ),
                    topRight: Radius.circular(
                      40,
                    ),
                  ),
                ),
                child: SizedBox(
                  height:420,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      
                      children: [
                        const InputHeader(
                          text: 'Username',
                        ),
                        const SizedBox(height: 8),
                        InputForm(
                          hintText: 'Masukkan username anda',
                          controller: controller.usernameController,
                        ),
                        const SizedBox(height: 10),
                        const InputHeader(
                          text: 'Password',
                        ),
                        const SizedBox(height: 8),
                        InputForm(
                          hintText: 'Masukkan password anda',
                          isPassword: true,
                          controller: controller.passwordController,
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        SizedBox(
                          width: double.infinity,
                          height: 40,
                          child: ElevatedButton(
                            onPressed: controller.login,
                            child: const Text('Masuk'),
                          ),
                        ),
                        const SizedBox(height:20,),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(Routes.REGISTER);
                            },
                            child: RichText(
                              text: TextSpan(
                                text: 'Anda sudah memiliki akun?',
                                style: GoogleFonts.inter(
                                  color: blackColor2,
                                ),
                                children: [
                                  TextSpan(
                                    text: ' Register',
                                    style: GoogleFonts.inter(
                                      color: blueNormal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                
                     ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
