part of 'widgets.dart';

class Button extends StatelessWidget {
  final String text;
  final ButtonStyle? buttonStyle;
  final Function onTap;
  final bool isDisabled;
  final double? width;

  const Button({
    super.key,
    required this.text,
    required this.onTap,
    this.buttonStyle,
    this.width,
    this.isDisabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? MediaQuery.of(context).size.width,
      height: 50,
      child: ElevatedButton(
        style: buttonStyle ?? defaultButtonStyle,
        onPressed: (!isDisabled)
            ? () {
                onTap();
              }
            : null,
        child: Text(
          text,
          style: boldPoppinsFontStyle.copyWith(color: whiteColor),
        ),
      ),
    );
  }
}
