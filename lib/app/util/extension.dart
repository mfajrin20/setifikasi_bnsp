import 'package:intl/intl.dart';

String currencyFormat(String data) {
  double value = double.parse(data);
  final formatter = NumberFormat.simpleCurrency(locale: "id_ID", decimalDigits: 2);
  String newSaldo = formatter.format(value);

  return newSaldo;
}

String ymdFormat(DateTime? data) {
  if (data != null) {
    var parse = DateFormat.yMMMd().format(data);
    return parse;
  }
  return '';
}

String mdFormat(DateTime? data) {
  if (data != null) {
    String parse = DateFormat.MMMd().format(data);
    return parse;
  }
  return '';
}
