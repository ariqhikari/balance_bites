part of 'widgets.dart';

class CustomBottomNavigation extends StatelessWidget {
  final int selectedIndex;
  final Function(int index)? onTap;

  const CustomBottomNavigation({
    super.key,
    this.selectedIndex = 0,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            height: 70,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                  color: '000000'.toColor().withOpacity(.05),
                  spreadRadius: 0,
                  blurRadius: 10,
                  offset: const Offset(0, -1), // changes position of shadow
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // * Home
                GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap!(0);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                    ),
                    child: Column(
                      children: [
                        // * Icon
                        SvgPicture.asset(
                          (selectedIndex == 0)
                              ? 'assets/icons/ic_home.svg'
                              : 'assets/icons/ic_home_normal.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(height: 4),
                        // * Title
                        Text(
                          'Beranda',
                          style: mediumPoppinsFontStyle.copyWith(
                            color: ((selectedIndex == 0)
                                ? successColor
                                : darkGrayColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                // * Reports
                GestureDetector(
                  onTap: () {
                    if (onTap != null) onTap!(1);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(
                      top: 18,
                    ),
                    child: Column(
                      children: [
                        // * Icon
                        SvgPicture.asset(
                          (selectedIndex == 1)
                              ? 'assets/icons/ic_calculator.svg'
                              : 'assets/icons/ic_calculator_normal.svg',
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(height: 4),
                        // * Title
                        Text(
                          'Kalkulator Kalori',
                          style: mediumPoppinsFontStyle.copyWith(
                            color: ((selectedIndex == 1)
                                ? successColor
                                : darkGrayColor),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        // Floating Center Button
        Positioned(
          bottom: 35, // Adjust the position as needed
          child: ButtonCircle(
            onTap: () async {
              String? upc = await SimpleBarcodeScanner.scanBarcode(
                context,
                isShowFlashIcon: true,
                delayMillis: 2000,
                scanFormat: ScanFormat.ONLY_BARCODE,
                cancelButtonText: '',
              );

              print('Result: $upc');
              Get.toNamed(Routes.RESULT_PRODUCT, arguments: upc);
            },
            child: SvgPicture.asset("assets/icons/ic_scan.svg"),
          ),
        ),
      ],
    );
  }
}
