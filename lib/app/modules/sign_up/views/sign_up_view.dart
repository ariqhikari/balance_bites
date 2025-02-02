import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Form(
              key: controller.signUpformKey,
              child: Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // * Logo
                    Center(child: Image.asset("assets/images/logo.png")),
                    const SizedBox(height: 50),
                    // * Nama
                    Text(
                      'Nama',
                      style: boldPoppinsFontStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(height: 8),
                    InputText(
                      controller: controller.nameController,
                      hint: 'Ketik nama Anda di sini',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Nama tidak boleh kosong';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // * Email
                    Text(
                      'Email',
                      style: boldPoppinsFontStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(height: 8),
                    InputText(
                      controller: controller.emailController,
                      hint: 'Tulis email di sini',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Email tidak boleh kosong';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // * Password
                    Text(
                      'Password',
                      style: boldPoppinsFontStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(height: 8),
                    InputPassword(
                      controller: controller.passwordController,
                      hint: 'Tulis password di sini',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong';
                        } else if (value.length < 8) {
                          return 'Password minimal harus terdiri dari 8 karakter';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    // * Confirm Password
                    Text(
                      'Konfirmasi Password',
                      style: boldPoppinsFontStyle.copyWith(color: blackColor),
                    ),
                    const SizedBox(height: 8),
                    InputPassword(
                      controller: controller.confPasswordController,
                      hint: 'Tulis password di sini',
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Password tidak boleh kosong';
                        } else if (value.length < 8) {
                          return 'Password minimal harus terdiri dari 8 karakter';
                        } else if (controller.passwordController.text !=
                            value) {
                          return 'Password dan konfirmasi password tidak cocok';
                        }

                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    // * Button
                    Obx(
                      () => controller.isLoading == true
                          ? makeLoadingIndicator()
                          : Button(
                              text: "Daftar",
                              onTap: () async {
                                if (controller.signUpformKey.currentState!
                                    .validate()) {
                                  await controller.register();
                                }
                              }),
                    ),
                    const SizedBox(height: 15),
                    // * Move to login
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah Punya Akun?',
                          style: semiBoldPoppinsFontStyle.copyWith(
                              color: darkGrayColor),
                        ),
                        const SizedBox(width: 5),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Text(
                            'Masuk',
                            style: semiBoldPoppinsFontStyle.copyWith(
                              color: successColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
