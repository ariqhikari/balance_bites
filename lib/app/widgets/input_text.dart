part of 'widgets.dart';

class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final String? Function(String?)? onChanged;
  final Function()? onSubmit;
  final bool isEnabled;
  final bool isSuffix;
  final bool isNumber;

  const InputText({
    super.key,
    required this.controller,
    required this.hint,
    this.onSubmit,
    this.validator,
    this.onChanged,
    this.isEnabled = true,
    this.isSuffix = false,
    this.isNumber = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        style: mediumPoppinsFontStyle.copyWith(
          fontSize: 16,
          color: '424242'.toColor(),
        ),
        validator: validator,
        keyboardType: isNumber != false ? TextInputType.number : null,
        decoration: defaultInputStyle.copyWith(
          hintText: hint,
          enabled: isEnabled,
          fillColor: isEnabled ? null : lightGrayColor,
          suffixIcon: isSuffix
              ? IconButton(
                  onPressed: onSubmit,
                  icon: Icon(
                    Icons.search,
                    color: '424242'.toColor(),
                  ),
                )
              : null,
        ),
      ),
    );
  }
}
