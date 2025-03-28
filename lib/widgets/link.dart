part of '../web_ui_commons.dart';

class AppLink extends StatelessWidget {
  final String text;
  final String url;
  final TextStyle? style;
  final VoidCallback? onTap;

  const AppLink({
    Key? key,
    required this.text,
    required this.url,
    this.style,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return HtmlWidget(
      textStyle: style,
      " <a style='color:${AppColors.primary}' href='$url'>$text</a>",
    );
  }
}
