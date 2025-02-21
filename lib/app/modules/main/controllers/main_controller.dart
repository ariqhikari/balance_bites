import 'package:balance_bites/app/data/data.dart';
import 'package:balance_bites/app/modules/user/user_controller.dart';
import 'package:balance_bites/app/routes/app_pages.dart';
import 'package:balance_bites/app/services/services.dart';
import 'package:balance_bites/app/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class MainController extends GetxController {
  final UserController userController = Get.put(UserController());
  late PageController pageController;
  var selectedPage = 0.obs;
  RxBool isLoading = false.obs;

  final TextEditingController searchController = TextEditingController();

  RxString selectedGender = ''.obs;
  final TextEditingController ageController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  var products = [].obs;

  var imagePath = ''.obs;
  var imageFile = Rx<XFile?>(null);

  // * history
  var historyCalculations = [].obs;

  @override
  void onInit() {
    pageController = PageController(initialPage: selectedPage.value);
    getProducts();
    super.onInit();
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  void getProducts() async {
    isLoading.value = true;
    ApiReturnValue<List<Product>> result =
        await ProductServices.getListProduct(searchController.text);

    isLoading.value = false;
    if (result.value != null) {
      products.assignAll(result.value!);
    }
  }

  void calculateCalories() async {
    if (selectedGender.value.isEmpty) {
      showSnackBar("Pilih jenis kelamin terlebih dahulu");
      return;
    } else if (ageController.text.isEmpty) {
      showSnackBar("Isi umur terlebih dahulu");
      return;
    } else if (heightController.text.isEmpty) {
      showSnackBar("Isi tinggi badan terlebih dahulu");
      return;
    } else if (weightController.text.isEmpty) {
      showSnackBar("Isi berat badan terlebih dahulu");
      return;
    }

    isLoading.value = true;
    ApiReturnValue<CalorieCalculator> result =
        await CalculatorServices.calculateCalories(
      gender: selectedGender.value,
      age: int.parse(ageController.text),
      height: int.parse(heightController.text),
      weight: int.parse(weightController.text),
    );

    isLoading.value = false;
    if (result.value != null) {
      Get.toNamed(Routes.RESULT_CALCULATOR, arguments: result.value);
    }
  }

  void getHistoryCalculations() async {
    isLoading.value = true;
    ApiReturnValue<List<CalorieCalculator>> result =
        await CalculatorServices.getHistoryCalculations();

    isLoading.value = false;
    if (result.value != null) {
      historyCalculations.assignAll(result.value!);
    }
  }
}
