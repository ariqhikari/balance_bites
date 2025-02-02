import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

import '../controllers/result_product_controller.dart';

class ResultProductView extends GetView<ResultProductController> {
  const ResultProductView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: WhiteAppBar(
        title: "Detail Produk",
        actions: [
          IconButton(
            icon: Icon(
              Icons.share_outlined,
              color: blackColor,
            ),
            onPressed: () {
              if (controller.product.value != null) {
                final product = controller.product.value!;
                final shareText = """
*Produk: ${product.title}*
- Nutri-Score: ${product.score}
- Deskripsi: ${product.reasoning}

Nutrisi:
${product.nutrients.map((e) => "- ${e.name}: ${e.amount}${e.unit}").join("\n")}

Gambar Produk:
${product.imageUrl}
                """;

                Share.share(shareText);
              }
            },
          ),
        ],
      ),
      body: Obx(
        () => controller.isLoading.value == true
            ? Center(child: makeLoadingIndicator())
            : controller.product.value == null
                ? Stack(
                    children: [
                      Container(
                        height: 230,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                              bottom: Radius.circular(12)),
                          color: grayColor,
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 25),
                          Center(
                            child: Text(
                              '?',
                              style:
                                  boldPoppinsFontStyle.copyWith(fontSize: 48),
                            ),
                          ),
                          Container(
                            height: 84,
                            margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height / 3.2,
                              left: defaultMargin,
                              right: defaultMargin,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 24,
                              vertical: 14,
                            ),
                            decoration: BoxDecoration(
                              color: whiteColor,
                              borderRadius: BorderRadius.circular(12),
                              boxShadow: [defaultBoxShadow],
                            ),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nutri-Score",
                                      style: regularPoppinsFontStyle.copyWith(
                                          fontSize: 16),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      '-',
                                      style: semiBoldPoppinsFontStyle.copyWith(
                                          fontSize: 20),
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(
                                    "assets/icons/ic_nutri_score.svg"),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 24),
                            child: Text(
                              "Produk Tidak Ditemukan",
                              style: semiBoldPoppinsFontStyle.copyWith(
                                  fontSize: 20),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                : SingleChildScrollView(
                    child: Stack(
                      children: [
                        Container(
                          height: 230,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(12)),
                            color: grayColor,
                            image: DecorationImage(
                              image: NetworkImage(
                                  controller.product.value!.imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 84,
                              margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height / 4.2,
                                left: defaultMargin,
                                right: defaultMargin,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: whiteColor,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [defaultBoxShadow],
                              ),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Nutri-Score",
                                        style: regularPoppinsFontStyle.copyWith(
                                            fontSize: 16),
                                      ),
                                      const SizedBox(height: 2),
                                      Text(
                                        controller.product.value!.score!,
                                        style: semiBoldPoppinsFontStyle
                                            .copyWith(fontSize: 20),
                                      ),
                                    ],
                                  ),
                                  SvgPicture.asset(
                                      "assets/icons/ic_nutri_score.svg"),
                                ],
                              ),
                            ),
                            const SizedBox(height: 24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              child: Text(
                                controller.product.value!.title,
                                style: semiBoldPoppinsFontStyle.copyWith(
                                    fontSize: 20),
                              ),
                            ),
                            const SizedBox(height: 8),
                            // * Tabbar
                            Obx(
                              () => CustomTabBar(
                                titles: const ['Deskripsi', 'Nutrisi'],
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
                                    ? Text(controller.product.value!.reasoning!)
                                    : Column(
                                        children: [
                                          for (var nutrient in controller
                                              .product.value!.nutrients)
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    nutrient.name,
                                                    style:
                                                        regularPoppinsFontStyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                  Text(
                                                    nutrient.amount.toString() +
                                                        nutrient.unit,
                                                    style:
                                                        regularPoppinsFontStyle
                                                            .copyWith(
                                                      fontSize: 16,
                                                    ),
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
                      ],
                    ),
                  ),
      ),
    );
  }
}
