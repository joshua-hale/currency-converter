import 'package:flutter/material.dart';

/// Round button that swaps the two currencies 
/// The icon spins half a turn on each tap
/// It uses the amber accent colour to match the CampusLink logo
class SwapButton extends StatefulWidget {
  const SwapButton({super.key, required this.onPressed});

  final VoidCallback onPressed;

  @override
  State<SwapButton> createState() => _SwapButtonState();
}

class _SwapButtonState extends State<SwapButton> {
  double _turns = 0;

  void _handleTap() {
    setState(() => _turns += 0.5);
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return AnimatedRotation(
      turns: _turns,
      duration: const Duration(milliseconds: 300),
      child: IconButton.filled(
        onPressed: _handleTap,
        tooltip: 'Swap currencies',
        iconSize: 28,
        style: IconButton.styleFrom(
          backgroundColor: scheme.secondary,
          foregroundColor: scheme.onSecondary,
        ),
        icon: const Icon(Icons.swap_vert),
      ),
    );
  }
}