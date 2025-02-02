import 'package:balance_bites/app/data/data.dart';
import 'package:get/get.dart';

class ResultCalculatorController extends GetxController {
  var result = Get.arguments as CalorieCalculator;
  var selectedIndex = 0.obs;
}
