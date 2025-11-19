import 'package:flutter/material.dart';

class SubmitButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final Color labelColor;
  final ButtonStyle? btnStyle;

  const SubmitButton({
    super.key,
    this.onPressed,
    required this.label,
    required this.labelColor,
    this.btnStyle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        onPressed: onPressed,
        style: btnStyle,
        child: Text(label, style: TextStyle(color: labelColor)),
      ),
    );
  }
}
