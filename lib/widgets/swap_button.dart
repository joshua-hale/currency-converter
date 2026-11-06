import 'package:flutter/material.dart';

/// Round button that swaps the two currencies. The icon spins half a turn on each tap.
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
    return AnimatedRotation(
      turns: _turns,
      duration: const Duration(milliseconds: 300),
      child: IconButton.filled(
        onPressed: _handleTap,
        tooltip: 'Swap currencies',
        iconSize: 28,
        icon: const Icon(Icons.swap_vert),
      ),
    );
  }
}
