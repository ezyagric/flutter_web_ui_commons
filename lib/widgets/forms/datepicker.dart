part of '../../web_ui_commons.dart';

class FormDatePicker extends StatefulWidget {
  FormDatePicker(
      {super.key, required this.label, this.validator, this.onChanged, this.initialValue});

  final FormFieldValidator? validator;
  Function? onChanged;
  String label;
  String? initialValue;

  @override
  State<FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<FormDatePicker> {
  final TextEditingController _dateController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    _dateController.text = widget.initialValue??"";
  }
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _dateController,
      readOnly: true,
      keyboardType: TextInputType.datetime,
      decoration:  InputDecoration(
        border: OutlineInputBorder(),
        hintText: '',
        labelText: widget.label,
      ),
      onTap: () {
        selectDob(context);
      },
      validator: widget.validator,

    );
  }

  selectDob(BuildContext context) async {
    DateTime initialDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1920),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.year,
      helpText: "Select Date of Birth",
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              onSurface: AppColors.text,
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primary, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != initialDate) {
      // controller.dob = Utils.formatDate(picked);

      setState(() {
        initialDate = picked;
        _dateController.text = Utils.formatDate(picked);
         widget.onChanged!(Utils.formatDate(picked));
      });
    }
  }
}
