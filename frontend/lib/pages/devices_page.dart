import 'package:flutter/material.dart';

import '../models/device.dart';
import '../services/api.dart';
import '../widgets/device_card.dart';

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {

  late Future<List<Device>> devices;


  @override
  void initState() {
    super.initState();

    devices = ApiService.getDevices();
  }


  void refreshDevices() {

    setState(() {
      devices = ApiService.getDevices();
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(

        title: const Text(
          "Devices",
        ),

        actions: [

          IconButton(

            icon: const Icon(
              Icons.refresh,
            ),

            onPressed: refreshDevices,

          ),

        ],

      ),


      body: FutureBuilder<List<Device>>(

        future: devices,


        builder: (context, snapshot) {


          if (snapshot.connectionState ==
              ConnectionState.waiting) {

            return const Center(

              child: CircularProgressIndicator(),

            );

          }



          if (snapshot.hasError) {

            return Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  const Icon(
                    Icons.error_outline,
                    size: 48,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  Text(
                    "Error: ${snapshot.error}",
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(
                    height: 12,
                  ),

                  ElevatedButton(

                    onPressed: refreshDevices,

                    child: const Text(
                      "Retry",
                    ),

                  ),

                ],

              ),

            );

          }



          final list = snapshot.data ?? [];



          if (list.isEmpty) {

            return const Center(

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  Icon(
                    Icons.phone_android,
                    size: 64,
                  ),

                  SizedBox(
                    height: 12,
                  ),

                  Text(
                    "No devices connected",
                  ),

                ],

              ),

            );

          }



          return RefreshIndicator(

            onRefresh: () async {

              refreshDevices();

            },


            child: ListView.builder(

              padding:
                  const EdgeInsets.all(12),


              itemCount:
                  list.length,


              itemBuilder:
                  (context, index) {


                return Padding(

                  padding:
                      const EdgeInsets.only(
                        bottom: 12,
                      ),


                  child: DeviceCard(

                    device: list[index],

                  ),

                );

              },

            ),

          );

        },

      ),

    );

  }

}