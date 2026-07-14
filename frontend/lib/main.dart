import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const SideDroidApp());
}

class SideDroidApp extends StatelessWidget {
  const SideDroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SideDroid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Colors.blue,
      ),
      home: const MainShell(),
    );
  }
}

class MainShell extends StatefulWidget {
  const MainShell({super.key});

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int page = 0;

  final pages = const [
    DevicesPage(),
    ApkPage(),
    RepoPage(),
    SettingsPage(),
  ];

  final titles = const [
    "Devices",
    "APK Installer",
    "Repositories",
    "Settings",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titles[page]),
      ),

      body: pages[page],

      navigationBar: NavigationBar(
        selectedIndex: page,
        onDestinationSelected: (index) {
          setState(() {
            page = index;
          });
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.phone_android),
            label: "Devices",
          ),
          NavigationDestination(
            icon: Icon(Icons.install_mobile),
            label: "APK",
          ),
          NavigationDestination(
            icon: Icon(Icons.inventory_2),
            label: "Repos",
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}


// ---------------- DEVICES ----------------

class DevicesPage extends StatefulWidget {
  const DevicesPage({super.key});

  @override
  State<DevicesPage> createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {

  List devices = [];

  Future<void> loadDevices() async {
    final response = await http.get(
      Uri.parse("http://127.0.0.1:8080/devices"),
    );

    if (response.statusCode == 200) {
      setState(() {
        devices = jsonDecode(response.body);
      });
    }
  }


  @override
  void initState() {
    super.initState();
    loadDevices();
  }


  @override
  Widget build(BuildContext context) {

    return RefreshIndicator(
      onRefresh: loadDevices,

      child: ListView(
        padding: const EdgeInsets.all(16),

        children: [

          if (devices.isEmpty)
            const Card(
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  "No devices found",
                ),
              ),
            ),


          for (var device in devices)

            Card(
              child: ListTile(

                leading: const Icon(
                  Icons.phone_android,
                ),

                title: Text(
                  device["model"] ?? "Unknown",
                ),

                subtitle: Text(
                  "${device["manufacturer"]}\nAndroid ${device["version"]}",
                ),

                trailing: const Icon(
                  Icons.check_circle,
                ),

              ),
            )

        ],
      ),
    );
  }
}


// ---------------- APK ----------------

class ApkPage extends StatelessWidget {
  const ApkPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Text(
        "APK Installer\nComing soon",
        textAlign: TextAlign.center,
      ),
    );

  }
}


// ---------------- REPOS ----------------

class RepoPage extends StatelessWidget {
  const RepoPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Text(
        "Repositories\nF-Droid, Obtainium, Custom repos",
        textAlign: TextAlign.center,
      ),
    );

  }
}


// ---------------- SETTINGS ----------------

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: Text(
        "SideDroid Settings",
      ),
    );

  }
}