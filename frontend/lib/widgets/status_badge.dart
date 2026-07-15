import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {

  final String text;
  final bool active;

  const StatusBadge({
    super.key,
    required this.text,
    required this.active,
  });


  @override
  Widget build(BuildContext context) {

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),

      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [

          Icon(
            Icons.circle,
            size: 10,
          ),

          const SizedBox(width: 8),

          Text(text),

        ],
      ),
    );
  }
}