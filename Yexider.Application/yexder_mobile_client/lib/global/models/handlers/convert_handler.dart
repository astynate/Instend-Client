import 'package:intl/intl.dart';

class ConvertHandler {
  static String convertTokenValueToString(double amount) {
    return amount.toInt().toString();
  }

  static String convertBytesToMB(double amount) {
    return (amount / 1024 / 1024).toInt().toString();
  }

  static String convertDatetimeToAmericanFormat(DateTime date) {
    return DateFormat('MMMM d, y').format(date);
  }
}