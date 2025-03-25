part of '../web_ui_commons.dart';

enum AlertType {
  primary,
  success,
  error,
  warning,
  info,
}

class AppAlert {
  static void show(
      {String title = 'Alert',
      String message = 'This is an alert',
      Color textColor = AppColors.white,
      Duration duration = const Duration(seconds: 5),
      SnackPosition position = SnackPosition.TOP,
      AlertType type = AlertType.primary}) {
    Color backgroundColor = AppColors.black;
    switch (type) {
      case AlertType.success:
        backgroundColor = AppColors.success;
      case AlertType.error:
        backgroundColor = AppColors.danger;
      case AlertType.warning:
        backgroundColor = AppColors.warning;
      case AlertType.info:
        backgroundColor = AppColors.black;
      default:
        backgroundColor = AppColors.black;
    }

    Get.snackbar('','',
       titleText:Padding(padding: const EdgeInsets.only(left:16), child: AppText(text: title, color: textColor, fontWeight: FontWeight.bold,)),
        messageText: Padding(
            padding: const EdgeInsets.only(left: 16),
            child: AppText(text: message, color: textColor.withOpacity(0.75),)),
        backgroundColor: backgroundColor,
        colorText: textColor,
        duration: duration,
        padding: const EdgeInsets.all(16),
        animationDuration: const Duration(milliseconds: 500),
        snackPosition: SnackPosition.TOP,
        maxWidth: 400,
        borderRadius: 8,
        isDismissible: true,
        snackStyle: SnackStyle.GROUNDED,
        margin: const EdgeInsets.only(top: 16, right: 16),
        
        icon: Icon(
          Icons.info,
          color: textColor,
          size: 44,
        ));
  }
}
