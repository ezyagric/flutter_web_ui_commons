part of '../web_ui_commons.dart';

class EmptyMessage extends StatelessWidget {
  final String icon;
  final String title;
  final String subtitle;
  final Widget child;

  const EmptyMessage(
      {super.key,
      this.icon = '',
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
            Visibility(
                visible: icon != '',
                child: SvgPicture.asset(
                  icon,
                  height: 80,
                )),
            const SizedBox(
              height: 28,
            ),
            AppText(
              text: title,
              fontWeight: FontWeight.bold,
              color: AppColors.text,
              textAlign: TextAlign.center,
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
