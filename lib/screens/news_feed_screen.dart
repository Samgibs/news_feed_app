import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  List<dynamic> _newsList = [];
  final String apiKey = "067c493d181146cab14d1a5331cc7291";

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    final response = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey"));
    if (response.statusCode == 200) {
      setState(() {
        _newsList = json.decode(response.body)["articles"];
      });
    }
  }

  void _showNewsDetail(String title, String description) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(description),
          actions: [
            TextButton(
                onPressed: () => Navigator.pop(context), child: Text("Close"))
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Feed")),
      body: _newsList.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _newsList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_newsList[index]["title"]),
                  subtitle: Text(_newsList[index]["source"]["name"]),
                  onTap: () => _showNewsDetail(
                      _newsList[index]["title"],
                      _newsList[index]["description"] ??
                          "No description available"),
                );
              },
            ),
    );
  }
}
