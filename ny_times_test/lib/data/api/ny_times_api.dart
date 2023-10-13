// api/ny_times_api.dart
import 'dart:convert';

import 'package:http/http.dart' as http;

class NyTimesApi {
  final String apiKey =
      'wyprAx1GaSskMKKOVIaaqgbUvQ4WjQHq'; // Replace with your API key
  final String baseUrl = 'http://api.nytimes.com/svc/mostpopular/v2/mostviewed';

  Future<List<Map<String, dynamic>>> fetchArticles(
      String section, String period) async {
    final response = await http
        .get(Uri.parse('$baseUrl/$section/$period.json?api-key=$apiKey'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data['results']);
    } else {
      throw Exception('Failed to fetch articles');
    }
  }
}
