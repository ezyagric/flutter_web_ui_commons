part of '../web_ui_commons.dart';

class AppProgressDialog {
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
        return Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 20),
                  AppText(text: title, type: TextType.headline4),
                  SizedBox(height: 10),
                  AppText(
                    text:message,
                    type: TextType.body,
                  )
                ]
              )
            ));
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
