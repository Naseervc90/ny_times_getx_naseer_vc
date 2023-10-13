import 'package:http/http.dart' as http;


import 'dart:convert';


import 'package:ny_times_test/app_config.dart';
import 'package:ny_times_test/data/model/article.dart';

class ArticleRepository {
  final String apiKey;
  final String apiEndpoint;

  ArticleRepository({required this.apiKey, required this.apiEndpoint});

  Future<List<Article>> getMostViewedArticles() async {
    const apiKey = nyTimesApiKey; // Replace with your actual API key
    const apiUrl = '$nyTimesApiEndpoint?api-key=$apiKey';
    try {
      final response = await http.get(
        Uri.parse(apiUrl),
      );

      if (response.statusCode == 200) {
        final jsonData = json.decode(response.body);

        if (jsonData['status'] == 'OK') {
          final List<Article> articles = (jsonData['results'] as List)
              .map((data) => Article.fromJson(data))
              .toList();

          return articles;
        } else {
          throw Exception('API returned an error: ${jsonData['status']}');
        }
      } else {
        throw Exception('Failed to load articles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
