import 'package:anarise/app/shared/widgets/form_widget.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../data/model/class_model.dart';
import '../../../routes/app_pages.dart';
import '../../../shared/services/classroom_service.dart';
import '../../../shared/theme/color_app.dart';
import '../../../shared/widgets/input_header_widget.dart';
import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterView'),
          centerTitle: true,
        ),
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
          child: Form(
            key: controller.formGlobalKey,
            child: Stack(
              children: [
                Column(
                  children: [
                    Image.network(
                      'https://res.cloudinary.com/dkkga3pht/image/upload/v1687128026/Group_8_jb4apo.png',
                    ),
                  ],
                ),
                Container(
                  height: MediaQuery.of(context).size.height,
                  padding: const EdgeInsets.only(
                    left: 30,
                    top: 30,
                    right: 30,
                  ),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const InputHeader(
                          text: 'Nama Lengkap',
                        ),
                        const SizedBox(height: 8),
                        const SizedBox(height: 10),
                        InputForm(
                          hintText: 'Masukkan nama lengkap anda',
                          controller: controller.fullNameController,
                        ),
                        const SizedBox(height: 10),
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
                          text: 'Pilih Kelas',
                        ),
                        const SizedBox(height: 8),
                        DropdownSearch<Classroom>(
                          autoValidateMode: AutovalidateMode.always,
                          validator: controller.validatorClassroom,
                          itemAsString: (item) => item.name!,
                          popupProps: const PopupProps.dialog(
                            showSearchBox: true,
                          ),
                          dropdownDecoratorProps: const DropDownDecoratorProps(
                            dropdownSearchDecoration:
                                InputDecoration(hintText: "Pilih kelas"),
                          ),
                          asyncItems: (_) async {
                            List<Classroom> data = [];
                            List<Classroom> responseData =
                                await ClassroomService().getAllListClassroom();
                            if (responseData.isNotEmpty) {
                              data.assignAll(responseData);
                            }
                            return data;
                          },
                          onChanged: controller.onChanged,
                        ),
                        const SizedBox(height: 10),
                        const InputHeader(
                          text: 'Password',
                        ),
                        const SizedBox(height: 8),
                        InputForm(
                          hintText: 'Masukkan password anda',
                          isPassword:true,

                          controller: controller.passwordController,
                        ),
                        const SizedBox(height: 10),
                        const InputHeader(
                          text: 'Konfirmasi Password',
                        ),
                        const SizedBox(height: 8),
                        InputForm(
                          hintText: 'Masukkan password anda',
                          isPassword:true,

                          controller: controller.passwordConfirmController,
                        ),
                        const SizedBox(height:20,),

                        SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            onPressed: controller.saveDataRegister,
                            child: const Text('Daftar'),
                          ),
                        ),
                        const SizedBox(height:20,),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                          child: Center(
                            child: RichText(
                              text: TextSpan(
                                  text: 'Anda sudah memiliki akun?',
                                  style: GoogleFonts.inter(
                                    color: blackColor2,
                                  ),
                                  children: [
                                    TextSpan(
                                      text: ' Login',
                                      style: GoogleFonts.inter(
                                        color: blueNormal,
                                      ),
                                    ),
                                  ]),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
