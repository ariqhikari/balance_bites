import 'package:balance_bites/app/modules/main/controllers/main_controller.dart';
import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalculatorView extends StatelessWidget {
  final MainController mainController = Get.put(MainController());

  CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius:
                const BorderRadius.vertical(bottom: Radius.circular(12)),
            color: grayColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Gender Selection
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _genderButton('Male', context),
                    _genderButton('Female', context),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              // Age Input
              _inputField(
                  label: 'Umur', controller: mainController.ageController),
              const SizedBox(height: 20),
              // Height Input
              _inputField(
                  label: 'Tinggi Badan',
                  controller: mainController.heightController),
              const SizedBox(height: 20),
              // Weight Input
              _inputField(
                  label: 'Berat Badan',
                  controller: mainController.weightController),
              const SizedBox(height: 20),
              Button(
                text: "Hitung Kalori",
                onTap: () => mainController.calculateCalories(),
              ),
              const SizedBox(height: 30),
              Text(
                'Histori Kalkulasi',
                style: semiBoldPoppinsFontStyle.copyWith(fontSize: 20),
              ),
              const SizedBox(height: 16),
              Obx(() {
                if (mainController.historyCalculations.isEmpty) {
                  return Text(
                    'No History',
                    style: regularPoppinsFontStyle.copyWith(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  );
                }

                return Column(
                  children: mainController.historyCalculations
                      .map((item) => CalculateItem(item))
                      .toList(),
                );
              }),
            ],
          ),
        ),
        Obx(() => mainController.isLoading.value == true
            ? Container(
                color: blackColor.withOpacity(0.5),
                child: Center(
                  child: makeLoadingIndicator(),
                ),
              )
            : SizedBox()),
      ],
    );
  }

  Widget _genderButton(String gender, BuildContext context) {
    return Obx(() {
      final bool isSelected = mainController.selectedGender.value == gender;
      return GestureDetector(
        onTap: () {
          mainController.selectedGender.value = gender;
        },
        child: Container(
          width: MediaQuery.of(context).size.width / 2.5,
          padding: const EdgeInsets.symmetric(vertical: 12),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? Colors.green : Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.grey[300]!),
          ),
          child: Text(
            gender,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            ),
          ),
        ),
      );
    });
  }

  Widget _inputField({
    required String label,
    required TextEditingController controller,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 100,
            child: TextField(
              controller: controller,
              textAlign: TextAlign.end,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'Tulis disini',
                hintStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.number,
            ),
          ),
        ],
      ),
    );
  }
}
