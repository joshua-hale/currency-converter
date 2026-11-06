import 'package:currency_converter/data/exchange_rates.dart';
import 'package:currency_converter/logic/converter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final usd = currencies[0];
  final gbp = currencies[1];
  final jpy = currencies[3];

  test('worked example: 100 USD to GBP is 79.00', () {
    expect(convert(100, usd, gbp), closeTo(79.0, 0.001));
  });

  test('worked example: 200 USD to GBP is 158.00', () {
    expect(convert(200, usd, gbp), closeTo(158.0, 0.001));
  });

  test('swapped: 100 GBP to USD uses the reverse rate (1 / 0.79)', () {
    expect(convert(100, gbp, usd), closeTo(126.58, 0.01));
  });

  test('same currency gives a rate of exactly 1', () {
    expect(rateBetween(gbp, gbp), 1.0);
  });

  test('empty or invalid input counts as 0', () {
    expect(parseAmount(''), 0);
    expect(parseAmount('.'), 0);
  });

  test('large numbers get thousand separators', () {
    expect(formatAmount(1234567.891, 2), '1,234,567.89');
  });

  test('JPY is shown with no decimal places', () {
    expect(formatAmount(convert(100, usd, jpy), jpy.decimals), '15,000');
  });

  test('rate is shown without trailing zeros', () {
    expect(formatRate(rateBetween(usd, gbp)), '0.79');
  });
}
