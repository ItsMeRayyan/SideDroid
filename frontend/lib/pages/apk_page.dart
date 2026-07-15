import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class ApkPage extends StatelessWidget {
  const ApkPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("APK"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.android,
              size: 64,
            ),

            const SizedBox(height: 16),

            const Text(
              "APK Manager",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              "Select an APK to install",
            ),

            const SizedBox(height: 24),

            ElevatedButton.icon(
              onPressed: () async {
                final result = await FilePicker.pickFiles(
                  type: FileType.custom,
                  allowedExtensions: ['apk'],
                );

                if (result == null) {
                  return;
                }

                final file = result.files.single;

                if (!context.mounted) return;

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      "Selected: ${file.name}",
                    ),
                  ),
                );

                debugPrint("APK Path: ${file.path}");
              },
              icon: const Icon(Icons.file_open),
              label: const Text("Import APK"),
            ),
          ],
        ),
      ),
    );
  }
}