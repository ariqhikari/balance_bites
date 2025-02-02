part of 'widgets.dart';

class WhiteAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? title;
  final List<Widget>? actions;

  const WhiteAppBar({super.key, this.title, this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: whiteColor,
      bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            color: grayColor,
            height: 2,
          )),
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_rounded,
          color: blackColor,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      title: title != null
          ? Text(
              title!,
              style: semiBoldPoppinsFontStyle,
            )
          : null,
      centerTitle: true,
      actions: actions,
    );
  }

  // Tentukan ukuran preferensi AppBar (biasanya tinggi default AppBar adalah kToolbarHeight)
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
