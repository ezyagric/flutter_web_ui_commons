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

ThemeData mainThemeWeb(BuildContext context) => ThemeData(
      textTheme:
          GoogleFonts.nunitoSansTextTheme(Theme.of(context).textTheme).apply(
        bodyColor: Colors.black,
      ),
      primaryColor: primaryColor,
      scaffoldBackgroundColor: Colors.white,
      colorScheme: ColorScheme.fromSwatch()
          .copyWith(primary: primaryColor, secondary: Colors.white),
      outlinedButtonTheme: mainOutlinedButtonTheme,
      inputDecorationTheme: mainInputDecorationTheme,
    );

InputDecorationTheme mainInputDecorationTheme = InputDecorationTheme(
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: lightBlue,
      width: 0.0,
    ),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: color9,
      width: 0.0,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: red,
      width: 0.0,
    ),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(5.0),
    borderSide: const BorderSide(
      color: red,
      width: 0.0,
    ),
  ),
);

OutlinedButtonThemeData mainOutlinedButtonTheme = OutlinedButtonThemeData(
  style: OutlinedButton.styleFrom(
    foregroundColor: lightBlue,
    side: const BorderSide(color: lightBlue),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
    ),
  ),
);

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

var mySideMenuStyle = SideMenuStyle(
  openSideMenuWidth: 225,

  // compactSideMenuWidth: 100,

  itemBorderRadius: const BorderRadius.all(Radius.circular(0.0)),
  iconSize: 22,
  displayMode: SideMenuDisplayMode.auto,
  hoverColor: selectedMenuItem,
  selectedColor: selectedMenuItem,
  selectedTitleTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
  selectedIconColor: Colors.white,
  unselectedIconColor: Colors.white70,
  unselectedTitleTextStyle: const TextStyle(color: Colors.white, fontSize: 14),
  showHamburger: true,
  // toggleColor: Colors.white,
  selectedIconColorExpandable: Colors.white70,
  unselectedIconColorExpandable: Colors.white70,
  arrowCollapse: Colors.white70,
  arrowOpen: Colors.white70,

  backgroundColor: blue,
);

var searchInputDecoration = InputDecoration(
  prefixIcon: const Icon(
    Icons.search,
    color: color9,
    size: 16,
  ),
  filled: true,
  fillColor: colorWhite,
  hintText: "Search ...",
  hintStyle: const TextStyle(
    color: Colors.grey,
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: color12,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: color12,
      width: 0.5,
    ),
    borderRadius: BorderRadius.circular(8),
  ),
  contentPadding: const EdgeInsets.symmetric(
    vertical: 12,
    horizontal: 16,
  ),
);

var amountToPayInputDecoration = const InputDecoration(
  labelStyle: TextStyle(fontSize: 15, fontFamily: 'NuninoSansBold'),
  labelText: "",
  hintText: 'e.g. 785111222',
  hintStyle: TextStyle(color: grey, fontWeight: FontWeight.normal),
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 20),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: grey),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.redAccent),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(width: 1, color: grey),
  ),
);

var defaultInputDecoration = InputDecoration(
  labelStyle: const TextStyle(fontSize: 13),
  hintStyle: TextStyle(fontSize: 12, color: Colors.grey[500]),
  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: BorderSide(color: Colors.grey.withValues(alpha: 0.3)),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(6),
    borderSide: const BorderSide(color: blue, width: 1.5),
  ),
  filled: true,
  fillColor: Colors.grey.withValues(alpha: 0.03),
);
