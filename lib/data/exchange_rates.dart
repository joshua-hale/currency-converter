import '../models/currency.dart';

/// The currencies available in the app.
const List<Currency> currencies = [
  Currency(code: 'USD', name: 'US Dollar', symbol: '\$'),
  Currency(code: 'GBP', name: 'British Pound', symbol: '£'),
  Currency(code: 'EUR', name: 'Euro', symbol: '€'),
  Currency(code: 'JPY', name: 'Japanese Yen', symbol: '¥', decimals: 0),
  Currency(code: 'NGN', name: 'Nigerian Naira', symbol: '₦'),
  Currency(code: 'CAD', name: 'Canadian Dollar', symbol: 'C\$'),
  Currency(code: 'INR', name: 'Indian Rupee', symbol: '₹'),
];

/// Fixed exchange rate table (no live API).
///
/// Every rate is "how much of this currency equals 1 USD". Storing all rates
/// against one base currency means any pair can be worked out from two values,
/// so adding a new currency only needs one new line.
///
/// These are illustrative sample values, not live market rates.
const Map<String, double> ratesPerUsd = {
  'USD': 1.0,
  'GBP': 0.79,
  'EUR': 0.92,
  'JPY': 150.0,
  'NGN': 1550.0,
  'CAD': 1.37,
  'INR': 83.0,
};
