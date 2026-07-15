import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/device.dart';

class ApiService {

  // Rust server address
  static const String baseUrl = "http://127.0.0.1:8080";


  static Future<List<Device>> getDevices() async {

    final response = await http.get(
      Uri.parse("$baseUrl/devices"),
    );


    if (response.statusCode == 200) {

      final List<dynamic> data = jsonDecode(response.body);

      return data
          .map((json) => Device.fromJson(json))
          .toList();

    } else {

      throw Exception(
        "Failed to load devices"
      );

    }
  }
}