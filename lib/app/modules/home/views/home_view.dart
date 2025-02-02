import 'package:balance_bites/app/data/data.dart';
import 'package:balance_bites/app/modules/main/controllers/main_controller.dart';
import 'package:balance_bites/app/routes/app_pages.dart';
import 'package:balance_bites/app/shared/shared.dart';
import 'package:balance_bites/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supercharged/supercharged.dart';

class HomeView extends StatelessWidget {
  final mainController = Get.put(MainController());
  HomeView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      color: grayColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // * Header
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, ${mainController.userController.user.value.name}',
                        style: semiBoldPoppinsFontStyle.copyWith(fontSize: 20),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateFormat('EEEE, d MMMM y').format(DateTime.now()),
                        style: regularPoppinsFontStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 40,
                    height: 40,
                    child: ButtonTransparent(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(16)),
                          ),
                          backgroundColor: whiteColor,
                          isScrollControlled: true,
                          useSafeArea: true,
                          builder: (context) => ModalBottomSheet(
                            title: "Apakah Anda Yakin Keluar?",
                            isBack: false,
                            content: Column(
                              children: [
                                SvgPicture.asset(
                                    "assets/images/illustration_logout.svg"),
                                const SizedBox(height: 24),
                                Button(
                                  text: "Yakin",
                                  buttonStyle: makeButton(redColor),
                                  onTap: () {
                                    Get.offAllNamed(Routes.SIGN_IN);
                                    removeToken();
                                  },
                                ),
                                const SizedBox(height: 12),
                                OutlineButton(
                                  text: "Batal",
                                  onTap: () => Get.back(),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      borderRadius: BorderRadius.circular(8),
                      color: 'FFC9C9'.toColor(),
                      child: Center(
                        child: SvgPicture.asset("assets/icons/ic_logout.svg"),
                      ),
                    ),
                  ),
                ],
              ),
              // * Search
              const SizedBox(height: 24),
              InputText(
                isSuffix: true,
                controller: mainController.searchController,
                hint: "Cari produk...",
                onSubmit: () => mainController.getProducts(),
              ),
              const SizedBox(height: 16),
              // * Products
              Obx(
                () => mainController.isLoading.value == true
                    ? Center(child: makeLoadingIndicator())
                    : mainController.products.isEmpty
                        ? Center(
                            child: Text(
                              'Produk tidak ditemukan.',
                              style: regularPoppinsFontStyle.copyWith(
                                fontSize: 16,
                                color: Colors.grey,
                              ),
                            ),
                          )
                        : GridView.count(
                            crossAxisCount: 2,
                            mainAxisSpacing: 12,
                            crossAxisSpacing: 12,
                            physics:
                                const NeverScrollableScrollPhysics(), // Disable GridView scrolling
                            shrinkWrap: true, // Prevent infinite size error
                            childAspectRatio: (1 / 1.3),
                            children: [
                              for (var product in mainController.products)
                                _buildProductCard(product),
                            ],
                          ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProductCard(Product product) {
    return ButtonTransparent(
      onTap: () => Get.toNamed(Routes.RESULT_PRODUCT, arguments: product.id),
      borderRadius: BorderRadius.circular(12),
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 12,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  product.imageUrl,
                  height: 120,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Image.asset(
                    "assets/images/image_not_found.png",
                    height: 120,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              product.title.length > 20
                  ? "${product.title.substring(0, 20)}..."
                  : product.title,
              style: mediumPoppinsFontStyle.copyWith(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
