import 'package:flutter/material.dart';

import '../logic/converter.dart';
import '../models/currency.dart';

/// Shows the converted amount (largest text on screen) and the rate being used.
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.converted,
    required this.rate,
    required this.from,
    required this.to,
  });

  final double converted;
  final double rate;
  final Currency from;
  final Currency to;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    final text = Theme.of(context).textTheme;
    return Card(
      color: scheme.primary,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text('Converted amount',
                style: text.labelLarge?.copyWith(color: scheme.onPrimary)),
            const SizedBox(height: 8),
            // FittedBox shrinks very long numbers instead of letting them overflow.
            FittedBox(
              child: Text(
                '${to.symbol}${formatAmount(converted, to.decimals)}',
                style: text.displaySmall?.copyWith(
                  color: scheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              '1 ${from.code} = ${formatRate(rate)} ${to.code}',
              style: text.titleMedium?.copyWith(color: scheme.onPrimary),
            ),
          ],
        ),
      ),
    );
  }
}
