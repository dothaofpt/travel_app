import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/place_model.dart';

class ApiService {
  static const String baseUrl = 'https://e22b-202-93-156-66.ngrok-free.app/api/getAllPlace';

  Future<List<Place>> fetchPlaces() async {
    try {
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = json.decode(response.body);
        return jsonResponse.map((json) => Place.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load places: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      print('Error: $e');
      throw Exception('Error: $e');
    }
  }
}