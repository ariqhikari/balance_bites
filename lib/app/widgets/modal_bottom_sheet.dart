part of 'widgets.dart';

class ModalBottomSheet extends StatelessWidget {
  final String title;
  final Widget content;
  final bool isBack;

  const ModalBottomSheet({
    super.key,
    required this.title,
    required this.content,
    this.isBack = true,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          padding: EdgeInsets.only(
            top: 16,
            left: defaultMargin,
            right: defaultMargin,
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 41,
                  height: 4,
                  decoration: BoxDecoration(
                      color: 'D9D9D9'.toColor(),
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
              const SizedBox(height: 24),
              isBack
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 1.5,
                          child: Text(
                            title,
                            style: boldPoppinsFontStyle.copyWith(fontSize: 16),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(Icons.close_rounded,
                              color: grayColor, size: 24),
                        ),
                      ],
                    )
                  : Center(
                      child: Text(
                        title,
                        style: boldPoppinsFontStyle.copyWith(fontSize: 16),
                      ),
                    ),
              const SizedBox(height: 16),
              content,
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}
