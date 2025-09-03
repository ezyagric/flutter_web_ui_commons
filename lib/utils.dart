part of "web_ui_commons.dart";

String addCommas(var value) {
  value = value.toString();
  String formattedValue = value.replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  return formattedValue;
}

String convertDate(String timestampString) {
  DateTime dateTime = DateTime.parse(timestampString);
  DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm');
  return formatter.format(dateTime);
}

String convertDateV2(String timestampString) {
  DateTime dateTime = DateTime.parse(timestampString);
  DateFormat formatter = DateFormat('dd/MMM/yy HH:mma');
  return formatter.format(dateTime);
}

String formatDateSafely(String dateString) {
  if (dateString.isEmpty) return 'Not provided';

  try {
    // Try to parse as ISO format first (YYYY-MM-DD or YYYY-MM-DDTHH:mm:ss)
    DateTime dateTime = DateTime.parse(dateString);
    DateFormat formatter = DateFormat('dd/MMM/yyyy');
    return formatter.format(dateTime);
  } catch (e) {
    try {
      // Try to parse DD/MM/YYYY format
      if (dateString.contains('/')) {
        final parts = dateString.split('/');
        if (parts.length == 3) {
          final day = int.parse(parts[0]);
          final month = int.parse(parts[1]);
          final year = int.parse(parts[2]);
          final dateTime = DateTime(year, month, day);
          DateFormat formatter = DateFormat('dd/MMM/yyyy');
          return formatter.format(dateTime);
        }
      }

      // Try to parse YYYY-M-D format
      if (dateString.contains('-')) {
        final parts = dateString.split('-');
        if (parts.length == 3) {
          final year = int.parse(parts[0]);
          final month = int.parse(parts[1]);
          final day = int.parse(parts[2]);
          final dateTime = DateTime(year, month, day);
          DateFormat formatter = DateFormat('dd/MMM/yyyy');
          return formatter.format(dateTime);
        }
      }

      // If all parsing fails, return the original string
      return dateString;
    } catch (e2) {
      return dateString;
    }
  }
}

Widget buildInfoRow(
  String label,
  String value, {
  bool isAmount = false,
  bool isHighlight = false,
  Color? statusColor,
}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 140,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: color13,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const SizedBox(width: 16),
        statusColor != null
            ? Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  // color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: statusColor, width: 1),
                ),
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 14,
                    color: statusColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            : Expanded(
                child: Text(
                  value,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 14,
                    color: isHighlight ? blue : Colors.black87,
                    fontWeight: isHighlight || isAmount
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
              ),
      ],
    ),
  );
}

class Utils {
  String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }

  // static String addCommas(var value) {
  //   value = value.toString();
  //   String formattedValue = value.replaceAllMapped(
  //       RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  //   return formattedValue;
  // }

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

  static Future<void> launchURL(String url) async {
    try {
      // launchUrl(Uri.parse(url));
    } catch (e) {
      AppAlert.show(title: "Error", message: "Could not launch url");
    }
  }
}
