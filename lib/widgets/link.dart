import 'package:flutter/material.dart';

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
    return InkWell(
      onTap: onTap ?? () {
        // Launch URL using url_launcher or similar package
        // launchUrl(Uri.parse(url));
      },
      child: Text(
        text,
        style: style?.copyWith(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ) ?? const TextStyle(
          decoration: TextDecoration.underline,
          color: Colors.blue,
        ),
      ),
    );
  }
}
