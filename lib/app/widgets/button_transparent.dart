part of 'widgets.dart';

class ButtonTransparent extends StatelessWidget {
  final Widget child;
  final Function onTap;
  final Color color;
  final BorderRadius? borderRadius;

  const ButtonTransparent({
    Key? key,
    required this.child,
    required this.onTap,
    this.color = Colors.transparent,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: borderRadius,
      child: InkWell(
        borderRadius: borderRadius,
        onTap: () => onTap(),
        child: child,
      ),
    );
  }
}
