part of 'widgets.dart';

class OutlineButton extends StatelessWidget {
  final String text;
  final Function onTap;
  final bool isDisabled;
  final double? width;

  const OutlineButton({
    super.key,
    required this.text,
    required this.onTap,
    this.width,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          foregroundColor: darkGrayColor,
          padding: const EdgeInsets.symmetric(
            horizontal: 28,
            vertical: 5,
          ),
          backgroundColor: Colors.transparent,
          side: BorderSide(color: darkGrayColor, width: 1),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
        ),
        onPressed: (!isDisabled)
            ? () {
                onTap();
              }
            : null,
        child: Text(
          text,
          style: boldPoppinsFontStyle.copyWith(
            color: darkGrayColor,
          ),
        ),
      ),
    );
  }
}
