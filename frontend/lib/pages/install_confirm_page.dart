import 'dart:async';
import 'package:flutter/material.dart';

class InstallConfirmPage extends StatefulWidget {

  final String deviceName;
  final String sourceName;

  const InstallConfirmPage({
    super.key,
    required this.deviceName,
    required this.sourceName,
  });


  @override
  State<InstallConfirmPage> createState() =>
      _InstallConfirmPageState();
}


class _InstallConfirmPageState
    extends State<InstallConfirmPage> {

  int countdown = 5;
  Timer? timer;


  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {

        if (countdown == 0) {
          timer.cancel();
        } else {
          setState(() {
            countdown--;
          });
        }

      },
    );
  }


  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Confirm"),
      ),

      body: Column(

        children: [

          Text(
            "Device: ${widget.deviceName}",
          ),

          Text(
            "Source: ${widget.sourceName}",
          ),


          const Spacer(),


          ElevatedButton(

            onPressed: countdown == 0
                ? () {
                    // Start install
                  }
                : null,

            child: Text(
              countdown == 0
                  ? "Install"
                  : "Wait $countdown seconds",
            ),

          ),

        ],

      ),

    );

  }
}