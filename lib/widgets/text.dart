part of '../web_ui_commons.dart';
class AppText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  TextAlign? textAlign;
  int? maxLines;

  AppText(
      {Key? key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.color = Colors.black,
      this.textAlign,
      this.maxLines})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines ?? 100000,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign == null ? null : TextAlign.center,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
  }
}
