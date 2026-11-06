/// A currency the app can convert between.
class Currency {
  const Currency({
    required this.code,
    required this.name,
    required this.symbol,
    this.decimals = 2,
  });

  /// ISO code, for example 'USD'.
  final String code;

  /// Full name shown in the dropdown, for example 'US Dollar'.
  final String name;

  /// Symbol shown before the converted amount, for example '$'.
  final String symbol;

  /// Number of decimal places to display (JPY normally uses 0).
  final int decimals;
}
