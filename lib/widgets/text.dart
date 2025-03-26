part of '../web_ui_commons.dart';

enum TextType {
  title,
  subtitle,
  body,
  caption,
  headline1,
  headline2,
  headline3,
  headline4,
}

class AppText extends StatelessWidget {
  final String text;
  final double? fontSize;
  final TextType type;
  final FontWeight? fontWeight;
  final Color? color;
  final TextAlign textAlign;
  final int? maxLines;

  const AppText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight = FontWeight.normal,
      this.color,
      this.type = TextType.body,
      this.textAlign = TextAlign.start,
      this.maxLines});

  @override
  Widget build(BuildContext context) {
    TextStyle style = TextStyle(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
       fontFamily: "Nunito Sans",
    );
    switch (type) {
      case TextType.title:
        style = style.copyWith(fontSize: fontSize ?? 24, fontWeight: fontWeight ?? FontWeight.bold);
        break;
      case TextType.subtitle:
        style = style.copyWith(fontSize: fontSize ?? 20, fontWeight: fontWeight ?? FontWeight.w600);
        break;
      case TextType.body:
        style = style.copyWith(fontSize: fontSize ?? 16);
        break;
      case TextType.caption:
        style = style.copyWith(fontSize: fontSize ?? 12);
        break;
      case TextType.headline1:
        style = style.copyWith(fontSize: fontSize ?? 32, fontWeight: fontWeight ?? FontWeight.bold);
        break;
      case TextType.headline2:
        style = style.copyWith(fontSize: fontSize ?? 28, fontWeight: fontWeight ?? FontWeight.bold);
        break;
      case TextType.headline3:
        style = style.copyWith(fontSize: fontSize ?? 24, fontWeight: fontWeight ?? FontWeight.bold);
        break;
      case TextType.headline4:
        style = style.copyWith(fontSize: fontSize ?? 20, fontWeight: fontWeight ?? FontWeight.bold, color: color?? AppColors.primaryDark);
        break;
      
    }

    return Text(
      text,
      maxLines: maxLines,
      textAlign: textAlign,
      style: style
    );
  }
}
