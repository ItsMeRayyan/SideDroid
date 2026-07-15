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

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: const Text("Devices"),
      ),

      body: FutureBuilder<List<Device>>(

        future: devices,

        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }


          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Error: ${snapshot.error}",
              ),
            );
          }


          final list = snapshot.data ?? [];


          if (list.isEmpty) {
            return const Center(
              child: Text(
                "No devices connected",
              ),
            );
          }


          return ListView.builder(

            padding: const EdgeInsets.all(12),

            itemCount: list.length,

            itemBuilder: (context, index) {

              return DeviceCard(
                device: list[index],
              );

            },
          );
        },
      ),
    );
  }
}