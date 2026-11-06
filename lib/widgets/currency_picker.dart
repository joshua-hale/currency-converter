import 'package:flutter/material.dart';

import '../data/exchange_rates.dart';
import '../models/currency.dart';

/// Dropdown for choosing a currency. Used twice, for "From" and "To".
class CurrencyPicker extends StatelessWidget {
  const CurrencyPicker({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
  });

  final String label;
  final Currency value;
  final ValueChanged<Currency> onChanged;

  @override
  Widget build(BuildContext context) {
    final muted = Theme.of(context).colorScheme.onSurfaceVariant;
    return InputDecorator(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<Currency>(
          value: value,
          isExpanded: true,
          items: [
            for (final c in currencies)
              DropdownMenuItem(
                value: c,
                child: Row(
                  children: [
                    Text(c.code, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(c.name,
                          style: TextStyle(color: muted), overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
          ],
          onChanged: (c) {
            if (c != null) onChanged(c);
          },
        ),
      ),
    );
  }
}
