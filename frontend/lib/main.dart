import 'package:flutter/material.dart';

void main() {
  runApp(const SideDroid());
}

class SideDroid extends StatelessWidget {
  const SideDroid({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SideDroid',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SideDroid 📱'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.all(24),
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text(
                  'Device Status',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text('ADB: Checking...'),
                Text('Fastboot: Checking...'),
                SizedBox(height: 20),
                Text('No devices connected'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}