part of 'widgets.dart';

class CalculateItem extends StatelessWidget {
  final CalorieCalculator result;
  const CalculateItem(this.result, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(boxShadow: [
        defaultBoxShadow,
        defaultBoxShadow,
        defaultBoxShadow,
      ]),
      child: ButtonTransparent(
        onTap: () {
          Get.toNamed(Routes.RESULT_CALCULATOR, arguments: result);
        },
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    result.calories.toString(),
                    style: semiBoldPoppinsFontStyle.copyWith(fontSize: 20),
                  ),
                  Text(
                    "Kalori",
                    style: semiBoldPoppinsFontStyle.copyWith(fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 8),
              Divider(color: grayColor, thickness: 1, height: 0),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'JK',
                            style: mediumPoppinsFontStyle.copyWith(
                              color: darkGrayColor,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            result.gender,
                            style: mediumPoppinsFontStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 21),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Umur',
                            style: mediumPoppinsFontStyle.copyWith(
                              color: darkGrayColor,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            result.age.toString(),
                            style: mediumPoppinsFontStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 21),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'TB',
                            style: mediumPoppinsFontStyle.copyWith(
                              color: darkGrayColor,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            result.height.toString(),
                            style: mediumPoppinsFontStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 21),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BB',
                            style: mediumPoppinsFontStyle.copyWith(
                              color: darkGrayColor,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            result.weight.toString(),
                            style: mediumPoppinsFontStyle.copyWith(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Icon(Icons.arrow_forward_ios),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
