part of web_ui_commons;

class Button extends StatelessWidget {
   const Button({super.key, required this.onTap});
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap(),
      child: const Text("Upload File"),
    );
  }
}
