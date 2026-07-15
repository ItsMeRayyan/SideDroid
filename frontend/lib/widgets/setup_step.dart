import 'package:flutter/material.dart';

class SetupStep extends StatelessWidget {

  final int number;
  final String title;
  final bool active;
  final bool complete;

  const SetupStep({
    super.key,
    required this.number,
    required this.title,
    required this.active,
    required this.complete,
  });


  @override
  Widget build(BuildContext context) {

    return Opacity(

      opacity: active || complete ? 1.0 : 0.35,

      child: Row(

        children: [

          CircleAvatar(

            child: Text(
              "$number",
            ),

          ),

          const SizedBox(
            width: 12,
          ),

          Text(
            title,
          ),

          if (complete)
            const Icon(
              Icons.check,
            ),

        ],

      ),

    );

  }

}