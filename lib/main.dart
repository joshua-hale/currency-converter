import 'package:flutter/material.dart';

import 'screens/converter_screen.dart';

void main() {
  runApp(const CurrencyConverterApp());
}

/// Root widget. Sets up the app theme so colours and text styles are consistent
class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF1B4D3E)),
        useMaterial3: true,
      ),
      home: const ConverterScreen(),
    );
  }
}
