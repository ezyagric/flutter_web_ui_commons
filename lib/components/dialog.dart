part of '../web_ui_commons.dart';

class AppDialog {
  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    required String message,
    List<Widget>? actions,
    bool barrierDismissible = true,
    Color? barrierColor,
    String? barrierLabel,
    bool useSafeArea = true,
    bool useRootNavigator = true,
    RouteSettings? routeSettings,
  }) {
    return showDialog<T>(
      context: context,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor ?? Colors.black54,
      barrierLabel: barrierLabel,
      useSafeArea: useSafeArea,
      useRootNavigator: useRootNavigator,
      routeSettings: routeSettings,
      builder: (BuildContext context) {
        return AlertDialog(
          title: AppText(text:"$title", fontSize: 18, fontWeight: FontWeight.bold,),
          content: AppText(text: "$message") ,
          actions: [
            AppButton(onPressed: () => Navigator.pop(context), label: "Cancel", type: AppButtonStyle.primaryOutline),
            AppButton(onPressed: () => Navigator.pop(context), label: "Continue"),
          ],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
        );
      },
    );
  }

  // Example usage:
  // AppDialog.show(
  //   context: context,
  //   title: Text('Dialog Title'),
  //   content: Text('Dialog Content'),
  //   actions: [
  //     TextButton(
  //       onPressed: () => Navigator.pop(context),
  //       child: Text('Cancel'),
  //     ),
  //     TextButton(
  //       onPressed: () => Navigator.pop(context, true),
  //       child: Text('OK'),
  //     ),
  //   ],
  // );
}
