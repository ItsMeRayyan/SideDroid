import 'package:flutter/material.dart';

import '../models/device.dart';

class InstallPage extends StatelessWidget {

  final Device device;

  const InstallPage({
    super.key,
    required this.device,
  });


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text(device.model),
      ),


      body: Padding(

        padding: const EdgeInsets.all(16),

        child: Column(

          crossAxisAlignment:
              CrossAxisAlignment.stretch,

          children: [

            Text(
              "Choose install source",
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall,
            ),


            const SizedBox(
              height: 20,
            ),


            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.android,
                ),

                title: const Text(
                  "Install APK",
                ),

                subtitle: const Text(
                  "Choose an APK file from your device",
                ),

                onTap: () {

                  // APK picker later

                },

              ),

            ),



            Card(

              child: ListTile(

                leading: const Icon(
                  Icons.public,
                ),

                title: const Text(
                  "Repositories",
                ),

                subtitle: const Text(
                  "Browse trusted APK sources",
                ),

                onTap: () {

                  // Repo browser later

                },

              ),

            ),

          ],

        ),

      ),

    );

  }
}