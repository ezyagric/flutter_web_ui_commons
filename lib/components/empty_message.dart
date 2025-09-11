part of '../web_ui_commons.dart';

class EmptyMessage extends StatelessWidget {
  IconData? icon;
  final String title;
  final String subtitle;
  final Widget child;

  EmptyMessage(
      {super.key,
      this.icon = Icons.sentiment_very_dissatisfied,
      required this.title,
      this.subtitle = '',
      this.child = const Text('')});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(36),
        child: Column(
          children: [
            Icon(
              icon,
              size: 80,
              color: AppColors.text,
            ),
            const SizedBox(
              height: 28,
            ),
            AppText(
              text: title,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
              textAlign: TextAlign.center,
              fontSize: 24,
            ),
            const SizedBox(
              height: 8,
            ),
            AppText(
              text: subtitle,
              color: AppColors.text,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            child
          ],
        ),
      ),
    );
  }
}
