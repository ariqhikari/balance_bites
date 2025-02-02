part of 'widgets.dart';

class InputPassword extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final bool isEnabled;

  RxBool isObscure = true.obs;

  InputPassword({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.isEnabled = true,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => TextFormField(
        obscureText: isObscure.value,
        controller: controller,
        style: mediumPoppinsFontStyle.copyWith(
          fontSize: 16,
          color: '424242'.toColor(),
        ),
        validator: validator,
        decoration: defaultInputStyle.copyWith(
          hintText: hint,
          enabled: isEnabled,
          fillColor: isEnabled ? null : lightGrayColor.withOpacity(.5),
          suffixIcon: IconButton(
            icon: SvgPicture.asset(isObscure.value
                ? 'assets/icons/ic_eye.svg'
                : 'assets/icons/ic_eye_hide.svg'),
            onPressed: () {
              isObscure.value = !isObscure.value;
            },
          ),
        ),
      ),
    );
  }
}
