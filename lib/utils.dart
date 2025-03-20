part of "web_ui_commons.dart";

class Utils {
  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }
  static String addCommas(var value) {
    value = value.toString();
    String formattedValue = value.replaceAllMapped(
        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
    return formattedValue;
  }

  static int roundToNearestFifty(double amount) {
    int rem = amount.round() % 50;
    if (rem > 0) {
      return ((amount.round() ~/ 50) * 50 + 50);
    }

    return amount.round();
  }

  static String roundToNearestFiftyStr(double amount) {
    return addCommas(roundToNearestFifty(amount));
  }

/// converts date to databasee format yyyy-mm-dd
  static String formatDate(DateTime datetime, {String format = "y-m-d"}) {
    return "${datetime.year.toString()}-${datetime.month.toString()}-${datetime.day.toString()}";
  }
}
