import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/repository.dart';


class RepositoryApi {

  static const String baseUrl =
      "http://127.0.0.1:8080";


  static Future<List<Repository>> getRepositories() async {

    final response = await http.get(
      Uri.parse("$baseUrl/repositories"),
    );


    if (response.statusCode == 200) {

      final List data = jsonDecode(response.body);


      return data
          .map(
            (item) => Repository.fromJson(item),
          )
          .toList();

    }


    throw Exception(
      "Failed to load repositories",
    );

  }

}