import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'https://test-api-jlbn.onrender.com/v5';

  Future<Map<String, dynamic>> getFeed() async {
    final response = await http.get(Uri.parse('$baseUrl/feed'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load feed');
    }
  }

  Future<Map<String, dynamic>> getDoctorDetails() async {
    final response = await http.get(Uri.parse('$baseUrl/feed/details'));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load doctor details');
    }
  }
}
