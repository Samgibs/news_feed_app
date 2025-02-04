import 'package:flutter/material.dart';

class ArticleDetailScreen extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;
  final String author;
  final String source;
  final String publishedAt;

  const ArticleDetailScreen({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.author,
    required this.source,
    required this.publishedAt,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (imageUrl.isNotEmpty)
                Image.network(
                  imageUrl,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.image_not_supported, size: 50);
                  },
                ),
              const SizedBox(height: 10),
              Text(description),
              const SizedBox(height: 10),
              Text('Author: $author'),
              Text('Source: $source'),
              Text('Published at: $publishedAt'),
            ],
          ),
        ),
      ),
    );
  }
}
