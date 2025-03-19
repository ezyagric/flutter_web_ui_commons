part of '../web_ui_commons.dart';

class AppContainer extends StatelessWidget {
  const AppContainer({super.key, this.child, this.padding, this.backgroundColor});
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: backgroundColor,
      padding: padding ?? const EdgeInsets.all(AppDimens.padding),
      child: SizedBox(
        width: AppDimens.containerWidth,
        child: child!,
      ),
    );
  }
}
