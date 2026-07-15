import 'package:flutter/material.dart';

class SideButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const SideButton({
    super.key,
    required this.text,
    required this.onPressed,
  });


  @override
  Widget build(BuildContext context) {

    return FilledButton(
      onPressed: onPressed,

      style: FilledButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 14,
        ),
      ),

      child: Text(text),
    );
  }
}