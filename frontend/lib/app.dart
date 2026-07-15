import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

import 'pages/devices_page.dart';
import 'pages/apk_page.dart';
import 'pages/repositories_page.dart';
import 'pages/settings_page.dart';

class SideDroidApp extends StatefulWidget {
  const SideDroidApp({super.key});

  @override
  State<SideDroidApp> createState() => _SideDroidAppState();
}

class _SideDroidAppState extends State<SideDroidApp> {

  int currentPage = 0;

  final pages = const [
    DevicesPage(),
    ApkPage(),
    RepositoriesPage(),
    SettingsPage(),
  ];


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
      ),

      home: Scaffold(

        body: pages[currentPage],

        bottomNavigationBar: NavigationBar(

          selectedIndex: currentPage,

          onDestinationSelected: (index) {
            setState(() {
              currentPage = index;
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
              icon: Icon(Icons.library_books),
              label: "Repos",
            ),

            NavigationDestination(
              icon: Icon(Icons.settings),
              label: "Settings",
            ),

          ],
        ),
      ),
    );
  }
}