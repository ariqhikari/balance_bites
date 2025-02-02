import 'package:balance_bites/app/routes/app_pages.dart';
import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SingleChildScrollView(
          child: Form(
            key: controller.sigInformKey,
            child: Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // * Logo
                  SizedBox(height: MediaQuery.of(context).size.height / 5),
                  Center(child: Image.asset("assets/images/logo.png")),
                  const SizedBox(height: 50),
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
                  const SizedBox(height: 30),
                  // * Button
                  Obx(
                    () => controller.isLoading == true
                        ? makeLoadingIndicator()
                        : Button(
                            text: "Masuk",
                            onTap: () async {
                              if (controller.sigInformKey.currentState!
                                  .validate()) {
                                await controller.login();
                              }
                            }),
                  ),
                  const SizedBox(height: 15),
                  // * Move to register
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tidak Punya Akun?',
                        style: semiBoldPoppinsFontStyle.copyWith(
                            color: darkGrayColor),
                      ),
                      const SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Get.toNamed(Routes.SIGN_UP);
                        },
                        child: Text(
                          'Daftar',
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
    );
  }
}
