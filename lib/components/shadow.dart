part of '../web_ui_commons.dart';

class AppShadow extends StatelessWidget {
  const AppShadow({super.key, this.padding = AppDimens.padding, required this.child});
  final double? padding;
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
        color: AppColors.white,
      margin: EdgeInsets.all(padding!.toDouble()),
      shape: RoundedRectangleBorder(
      
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(padding: EdgeInsets.all(padding!), child: child,),
    );
  }
}
