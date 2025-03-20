part of '../../web_ui_commons.dart';

class AppButton extends StatelessWidget {
  final Function() onPressed;
  final IconData? icon;
  final String label;
  final String type;
  final double? borderRadius;//button type
  final Color color = Colors.white;
  final bool enabled;
  final String iconPlacement;

  const AppButton({
      super.key,
      required this.onPressed,
      this.type = AppButtonStyle.primary,
      this.label = "Button",
      this.borderRadius,
      this.icon,
      this.iconPlacement = IconPlacement.start,
      this.enabled=true});

  


@override
  Widget build(BuildContext context) {
    Color btnColor = AppColors.primary;
    Color borderColor = Colors.transparent;

    Color labelColor = AppColors.white;

    if (type == AppButtonStyle.success) btnColor = AppColors.success;
    if (type == AppButtonStyle.danger) btnColor = AppColors.danger;
    if (type == AppButtonStyle.cancel) btnColor = AppColors.light;
    if (type == AppButtonStyle.disabled) btnColor = AppColors.disabled;

    if (type == AppButtonStyle.successOutline) {
      btnColor = AppColors.white;
      labelColor = AppColors.success;
      borderColor = AppColors.success;
    }

    if (type == AppButtonStyle.primaryOutline) {
      btnColor = AppColors.white;
      labelColor = AppColors.primary;
      borderColor = AppColors.primary;
    } 
    
    if (type == AppButtonStyle.lightOutline) {
      btnColor = AppColors.transparent;
      labelColor = AppColors.white;
      borderColor = AppColors.white;
    }

    if (!enabled) btnColor = AppColors.disabled;
    //colors

    if (type == AppButtonStyle.cancel) labelColor = AppColors.textLight;
    return TextButton.icon(
      onPressed: enabled ? onPressed : null,
      iconAlignment: IconPlacement.start == iconPlacement? IconAlignment.start : IconAlignment.end,
      icon: Icon(
        icon,
        color: labelColor,
        size: (icon == null ? 0 : 24),
      ),
      label: Text(
        label,
        style: TextStyle(color: labelColor, fontWeight: FontWeight.bold),
      ),
      style: ButtonStyle(
          minimumSize: const WidgetStatePropertyAll(Size(0, 48)),
          backgroundColor: WidgetStatePropertyAll(btnColor),
          shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(borderRadius ?? AppDimens.radius),
                side: BorderSide(color: borderColor)),
          )),
    );
    
  }
}

class AppButtonStyle {
   static const primary = "primary";
   static const secondary = "secondary";
  static const success = "success";
  static const danger = "danger";
  static const  cancel = "cancel";
  static const  disabled = "disabled";


  static const  primaryOutline = "primary-outline";
  static const  successOutline = "success-outline";
  static const  secondaryOutline = "secondary-outline";
  static const  lightOutline = "light-outline";
}

class IconPlacement {
  
  static const  start = "start";
  static const  end = "end";
}

