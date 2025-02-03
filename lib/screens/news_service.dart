import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsService {
  final String apiKey = "067c493d181146cab14d1a5331cc7291";

  Future<List<dynamic>> fetchNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey"));

    if (response.statusCode == 200) {
      return json.decode(response.body)["articles"];
    } else {
      throw Exception("Failed to load news");
    }
  }
}
