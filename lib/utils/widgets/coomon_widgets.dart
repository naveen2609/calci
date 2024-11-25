import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;
  final Color color;
  final bool isWide;

  const CalculatorButton({super.key, 
    required this.label,
    required this.onPressed,
    this.color = Colors.grey,
    this.isWide = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: isWide ? 2 : 1,
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape: const CircleBorder(),
            padding: EdgeInsets.symmetric(
                vertical: 20, horizontal: isWide ? 40 : 0),
          ),
          child: Text(
            label,
            style: const TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
