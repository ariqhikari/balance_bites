import 'package:balance_bites/app/modules/calculator/views/calculator_view.dart';
import 'package:balance_bites/app/modules/home/views/home_view.dart';
import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/main_controller.dart';

class MainView extends GetView<MainController> {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return StatusBar(
      child: Scaffold(
        backgroundColor: whiteColor,
        body: SafeArea(
          child: Stack(
            children: [
              // * Page View
              PageView(
                controller: controller.pageController,
                onPageChanged: (index) {
                  controller.selectedPage.value = index;
                },
                children: [
                  // * Home Page
                  HomeView(),
                  // * Calculator Page
                  CalculatorView(),
                ],
              ),
              // * Bottom Navigation
              Obx(
                () => CustomBottomNavigation(
                  selectedIndex: controller.selectedPage.value,
                  onTap: (index) {
                    controller.selectedPage.value = index;
                    controller.pageController.animateToPage(
                      controller.selectedPage.value,
                      curve: Curves.easeInOut,
                      duration: const Duration(milliseconds: 400),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
