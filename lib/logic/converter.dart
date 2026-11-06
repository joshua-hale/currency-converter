import '../data/exchange_rates.dart';
import '../models/currency.dart';

/// Returns how many units of [to] equal 1 unit of [from].
double rateBetween(Currency from, Currency to) {
  return ratesPerUsd[to.code]! / ratesPerUsd[from.code]!;
}

/// Converts [amount] from one currency to another using the fixed rates.
double convert(double amount, Currency from, Currency to) {
  return amount * rateBetween(from, to);
}

/// Turns the text in the amount field into a number.
/// Empty or invalid text (for example a lone '.') counts as 0.
double parseAmount(String text) {
  return double.tryParse(text) ?? 0;
}

/// Formats a number with thousand separators, for example 1234567.8 -> '1,234,567.80'.
String formatAmount(double value, int decimals) {
  final parts = value.toStringAsFixed(decimals).split('.');
  final whole = parts[0];
  final buffer = StringBuffer();
  for (var i = 0; i < whole.length; i++) {
    if (i > 0 && (whole.length - i) % 3 == 0) buffer.write(',');
    buffer.write(whole[i]);
  }
  return parts.length > 1 ? '$buffer.${parts[1]}' : buffer.toString();
}

/// Formats a rate without trailing zeros, for example 0.7900 -> '0.79'.
/// Very small rates get more decimal places so they don't show as 0.
String formatRate(double rate) {
  final text = rate.toStringAsFixed(rate < 0.01 ? 6 : 4);
  return text.replaceFirst(RegExp(r'\.?0+$'), '');
}
