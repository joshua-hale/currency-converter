import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Text field for the amount to convert. Only allows digits and one decimal point.
class AmountField extends StatelessWidget {
  const AmountField({super.key, required this.controller, required this.onChanged});

  final TextEditingController controller;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      inputFormatters: [
        // Blocks letters, minus signs and a second decimal point.
        FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d*')),
        // Keeps very large numbers from overflowing the screen.
        LengthLimitingTextInputFormatter(12),
      ],
      style: Theme.of(context).textTheme.headlineSmall,
      decoration: const InputDecoration(
        labelText: 'Amount',
        border: OutlineInputBorder(),
      ),
    );
  }
}
