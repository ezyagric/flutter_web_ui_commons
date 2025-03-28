part of '../../web_ui_commons.dart';
class AppSelectInput extends StatefulWidget {
  AppSelectInput(
      {super.key,
      required this.value,
      this.label = "Select Input",
      this.marginBottom,
      required this.items,
      this.placeholder = "Select",
      this.showLabel = true,
      this.onChanged,
      this.validator});
  final List<String> items;
  final String value;
  final String placeholder;
  final String label;
  final bool showLabel;
  final double? marginBottom;
  final Function? onChanged;
  //Function? validator;
  final FormFieldValidator? validator;

  @override
  State<AppSelectInput> createState() => _AppSelectInputState();
}

class _AppSelectInputState extends State<AppSelectInput> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      DropdownButtonFormField<String>(
        value: widget.value,
        hint: AppText(text: widget.label),
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          // icon: Icon(Icons.book),
          hintText: '',
          labelText: widget.showLabel?widget.label:'',
        ),
        items: widget.items.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: AppText(text: value),
          );
        }).toList(),
        onChanged: (newValue) {
          widget.onChanged!(newValue);
        },
        validator: widget.validator,
      ),
    ]);
  }
}
