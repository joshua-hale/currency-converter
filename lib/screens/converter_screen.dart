import 'package:flutter/material.dart';

import '../data/exchange_rates.dart';
import '../logic/converter.dart';
import '../models/currency.dart';
import '../widgets/amount_field.dart';
import '../widgets/currency_picker.dart';
import '../widgets/result_card.dart';
import '../widgets/swap_button.dart';

/// The main (and only) screen of the app.
class ConverterScreen extends StatefulWidget {
  const ConverterScreen({super.key});

  @override
  State<ConverterScreen> createState() => _ConverterScreenState();
}

class _ConverterScreenState extends State<ConverterScreen> {
  // The state is only the three inputs. The rate and converted amount are
  // calculated from these in build(), so they can never be out of date.
  final TextEditingController _amountController =
      TextEditingController(text: '100');
  Currency _from = currencies[0]; // USD
  Currency _to = currencies[1]; // GBP

  @override
  void dispose() {
    _amountController.dispose();
    super.dispose();
  }

  /// Swaps the "from" and "to" currencies.
  void _swap() {
    setState(() {
      final temp = _from;
      _from = _to;
      _to = temp;
    });
  }

  @override
  Widget build(BuildContext context) {
    final amount = parseAmount(_amountController.text);
    final rate = rateBetween(_from, _to);
    final converted = convert(amount, _from, _to);

    return Scaffold(
      appBar: AppBar(title: const Text('Currency Converter')),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            // Stops the layout stretching too wide on tablets.
            constraints: const BoxConstraints(maxWidth: 480),
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AmountField(
                    controller: _amountController,
                    // Rebuild on every keystroke so the result updates live.
                    onChanged: (_) => setState(() {}),
                  ),
                  const SizedBox(height: 24),
                  CurrencyPicker(
                    label: 'From',
                    value: _from,
                    onChanged: (c) => setState(() => _from = c),
                  ),
                  const SizedBox(height: 8),
                  Center(child: SwapButton(onPressed: _swap)),
                  const SizedBox(height: 8),
                  CurrencyPicker(
                    label: 'To',
                    value: _to,
                    onChanged: (c) => setState(() => _to = c),
                  ),
                  const SizedBox(height: 32),
                  ResultCard(
                    converted: converted,
                    rate: rate,
                    from: _from,
                    to: _to,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Rates are fixed sample values, not live market rates.',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
