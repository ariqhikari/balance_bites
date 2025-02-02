import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/result_calculator_controller.dart';

class ResultCalculatorView extends GetView<ResultCalculatorController> {
  const ResultCalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: WhiteAppBar(
        title: "Perhtitungan Kalori",
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: blackColor,
            ),
            onPressed: () {
              final result = controller.result;
              final shareText = """
*Hasil Perhitungan Kalori Anda*

Informasi Dasar:
- Jenis Kelamin: ${result.gender}
- Umur: ${result.age}
- Tinggi Badan: ${result.height}
- Berat Badan: ${result.weight}

Estimasi Kebutuhan Kalori:
- Kalor per hari: ${result.calories} kcal
- Kesimpulan: ${result.notes}

Rekomendasi Aktivitas:
${result.activityRecommendations.map((e) => "- ${e.name}: ${e.duration}").join("\n")}

Rekomendasi Asupan Harian:
${result.mealRecommendations.map((e) => "- ${e.name}: ${e.calories} kcal").join("\n")}
              """;

              Share.share(shareText);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(12)),
              color: grayColor,
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    controller.result.calories.toString(),
                    style: boldPoppinsFontStyle.copyWith(fontSize: 52),
                  ),
                  Text(
                    "Kalori per hari",
                    style: semiBoldPoppinsFontStyle.copyWith(fontSize: 16),
                  )
                ],
              ),
            ),
          ),
          // * Tabbar
          Obx(
            () => CustomTabBar(
              titles: const ['Kesimpulan', 'Rekomendasi'],
              selectedIndex: controller.selectedIndex.value,
              onTap: (index) {
                controller.selectedIndex.value = index;
              },
            ),
          ),
          Obx(
            () => Padding(
              padding: const EdgeInsets.all(defaultPadding),
              child: controller.selectedIndex.value == 0
                  ? Text(
                      controller.result.notes,
                      textAlign: TextAlign.justify,
                      style: regularPoppinsFontStyle.copyWith(
                        fontSize: 16,
                      ),
                    )
                  : Column(
                      children: [
                        Text(
                          "Rekomendasi Aktivitas Harian",
                          style:
                              semiBoldPoppinsFontStyle.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        for (var item
                            in controller.result.activityRecommendations)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    item.name,
                                    style: semiBoldPoppinsFontStyle.copyWith(
                                        fontSize: 14),
                                  ),
                                ),
                                Text(
                                  item.duration,
                                  style: regularPoppinsFontStyle.copyWith(
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        const SizedBox(height: 16),
                        Text(
                          "Rekomendasi Asupan Harian",
                          style:
                              semiBoldPoppinsFontStyle.copyWith(fontSize: 16),
                        ),
                        const SizedBox(height: 8),
                        for (var item in controller.result.mealRecommendations)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    item.name,
                                    style: semiBoldPoppinsFontStyle.copyWith(
                                        fontSize: 14),
                                  ),
                                ),
                                Text(
                                  "${item.calories} kcal",
                                  style: regularPoppinsFontStyle.copyWith(
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
