part of 'web_ui_commons.dart';

ThemeData ezyAgricWebTheme(BuildContext context) {
  return ThemeData(
    fontFamily: GoogleFonts.nunitoSans().fontFamily,
    primaryColor: AppColors.primary,
    scaffoldBackgroundColor: AppColors.light,
    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
  textTheme: GoogleFonts.robotoTextTheme(
           Theme.of(context).textTheme, // Use current theme's text theme
         ),  
  );
}

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorderFocused = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(width: 2, color: AppColors.primary),
    gapPadding: 10,
  );

  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(width: 2, color: AppColors.light),
    gapPadding: 10,
  );

  OutlineInputBorder outlineInputErrorBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(4.0),
    borderSide: const BorderSide(width: 2, color: Colors.redAccent),
    gapPadding: 10,
  );

  return InputDecorationTheme(
      // floatingLabelBehavior: FloatingLabelBehavior.always,
      // contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorderFocused,
      border: outlineInputBorder,
      //errorStyle: const TextStyle(height: 0),
      errorBorder: outlineInputErrorBorder);
}

CheckboxThemeData checkboxTheme() {
  return CheckboxThemeData(
    checkColor:
        MaterialStateProperty.all(Colors.white), // Color of the check mark
    fillColor: WidgetStateProperty.resolveWith((states) {
      if (states.contains(WidgetState.selected)) {
        return AppColors.primary; // Color when checked
      }
      return Colors.transparent; // Color when unchecked
    }),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(2), // Rounded corners
    ),
    side: BorderSide(
        color: AppColors.primary, width: 2), // Border color and width
  );
}

RadioThemeData radioButtonTheme() {
  return RadioThemeData(fillColor: WidgetStateProperty.resolveWith((states) {
    if (states.contains(WidgetState.selected)) {
      return AppColors.primary; // Color when checked
    }
    return AppColors.text; // Color when unchecked
  }));
}

TabBarTheme tabBarThemeData() {
  return TabBarTheme(
    labelColor: AppColors.primary,
    unselectedLabelColor: Colors.grey,
    indicatorColor: AppColors.primary,
    unselectedLabelStyle: TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: 'Nunito Sans'),
    labelStyle: TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w900,
        fontFamily: GoogleFonts.nunitoSans().fontFamily),
  );
}
