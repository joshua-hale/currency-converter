import 'package:flutter/material.dart';

import 'screens/converter_screen.dart';

// CampusLink colours, matching the Figma prototype.
const Color brandPrimary = Color(0xFF0E4D64); 
const Color brandAccent = Color(0xFFFFB547); 
const Color brandInk = Color(0xFF14212B); 
const Color brandMuted = Color(0xFF53616D); 
const Color brandBorder = Color(0xFFD9E1E7); 
const Color brandBackground = Color(0xFFF2F5F7);
const Color brandError = Color(0xFFB3261E);

void main() {
  runApp(const CurrencyConverterApp());
}

// Root widget. Sets up the app theme so colours and text styles are consistent
class CurrencyConverterApp extends StatelessWidget {
  const CurrencyConverterApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Currency Converter',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: brandPrimary,
          onPrimary: Colors.white,
          secondary: brandAccent,
          onSecondary: brandInk,
          error: brandError,
          onError: Colors.white,
          surface: Colors.white,
          onSurface: brandInk,
          onSurfaceVariant: brandMuted,
          outline: brandBorder,
        ),
        scaffoldBackgroundColor: brandBackground,
        appBarTheme: const AppBarTheme(
          backgroundColor: brandBackground,
          foregroundColor: brandInk,
          elevation: 0,
        ),
        // White fields on the grey background like the Figma cards
        inputDecorationTheme: const InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
        ),
      ),
      home: const ConverterScreen(),
    );
  }
}