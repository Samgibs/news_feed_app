import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news_service.dart';

class NewsFeedScreen extends StatefulWidget {
  @override
  _NewsFeedScreenState createState() => _NewsFeedScreenState();
}

class _NewsFeedScreenState extends State<NewsFeedScreen> {
  List<dynamic> _newsList = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  Future<void> _fetchNews() async {
    try {
      NewsService newsService = NewsService();
      final news = await newsService.fetchNews();
      setState(() {
        _newsList = news;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Failed to load news. Please try again later."),
        backgroundColor: const Color.fromARGB(255, 230, 22, 7),
      ));
    }
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not open the URL';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("News Feed")),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : _newsList.isEmpty
              ? Center(child: Text("No news available"))
              : ListView.builder(
                  itemCount: _newsList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(_newsList[index]["title"] ?? "No Title"),
                      subtitle: Text(_newsList[index]["source"]["name"] ??
                          "Unknown Source"),
                      onTap: () => _launchURL(_newsList[index]["url"] ?? ""),
                    );
                  },
                ),
    );
  }
}
