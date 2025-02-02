part of 'widgets.dart';

class StatusBar extends StatelessWidget {
  final Brightness brightness;
  final Widget child;

  const StatusBar({
    super.key,
    this.brightness = Brightness.dark,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: brightness,
        statusBarColor: Colors.transparent,
      ),
      child: child,
    );
  }
}
