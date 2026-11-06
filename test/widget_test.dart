import 'package:currency_converter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('result updates live as the amount changes', (tester) async {
    await tester.pumpWidget(const CurrencyConverterApp());

    // Starts with 100 USD to GBP.
    expect(find.text('£79.00'), findsOneWidget);
    expect(find.text('1 USD = 0.79 GBP'), findsOneWidget);

    // Typing a new amount updates the result with no button press.
    await tester.enterText(find.byType(TextField), '200');
    await tester.pump();
    expect(find.text('£158.00'), findsOneWidget);
  });

  testWidgets('swap button swaps the currencies', (tester) async {
    await tester.pumpWidget(const CurrencyConverterApp());

    await tester.tap(find.byTooltip('Swap currencies'));
    await tester.pumpAndSettle();

    expect(find.text('\$126.58'), findsOneWidget);
    expect(find.text('1 GBP = 1.2658 USD'), findsOneWidget);
  });
}
