import 'package:intl/intl.dart';

class ConvertDate {
  ConvertDate._();
  static String formatDate(DateTime? date) {
    return DateFormat("EEEE d MMMM").format(date!);
  }

  static String formatTime(DateTime? dateTime) {
    return DateFormat.jm().format(dateTime!);
  }
}
