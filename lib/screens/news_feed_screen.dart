// import 'package:flutter/material.dart';
// import 'news_service.dart';

// class NewsFeedScreen extends StatefulWidget {
//   @override
//   _NewsFeedScreenState createState() => _NewsFeedScreenState();
// }

// class _NewsFeedScreenState extends State<NewsFeedScreen> {
//   List<dynamic> newsList = [];
//   bool isLoading = true;
//   String errorMessage = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchNews();
//   }

//   void fetchNews() async {
//     final newsApiService = NewsApiService();
//     try {
//       var news = await newsApiService.fetchNews();
//       print('Fetched News Articles: ${news.length}');
//       setState(() {
//         newsList = news;
//         isLoading = false;
//       });
//     } catch (e) {
//       print("Error fetching news: $e");
//       setState(() {
//         isLoading = false;
//         errorMessage = 'Failed to load news: $e';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('News Feed')),
//       body: isLoading
//           ? Center(child: CircularProgressIndicator())
//           : errorMessage.isNotEmpty
//               ? Center(
//                   child:
//                       Text(errorMessage, style: TextStyle(color: Colors.red)))
//               : newsList.isEmpty
//                   ? Center(child: Text('No news available'))
//                   : ListView.builder(
//                       itemCount: newsList.length,
//                       itemBuilder: (context, index) {
//                         var article = newsList[index];

//                         String title = article['title'] ?? 'No title available';
//                         String description = article['description'] ??
//                             'No description available';
//                         String imageUrl = article['urlToImage'] ?? '';
//                         String author = article['author'] ?? 'Unknown author';
//                         String source =
//                             article['source']?['name'] ?? 'Unknown source';
//                         String publishedAt =
//                             article['publishedAt'] ?? 'Unknown date';

//                         return Card(
//                           margin:
//                               EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                           elevation: 3,
//                           child: ListTile(
//                             leading: imageUrl.isNotEmpty
//                                 ? Image.network(
//                                     imageUrl,
//                                     width: 80,
//                                     height: 80,
//                                     fit: BoxFit.cover,
//                                     errorBuilder: (context, error, stackTrace) {
//                                       return Icon(Icons.image_not_supported);
//                                     },
//                                   )
//                                 : Icon(Icons.image_not_supported),
//                             title: Text(title,
//                                 maxLines: 2, overflow: TextOverflow.ellipsis),
//                             subtitle: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('Author: $author',
//                                     style: TextStyle(
//                                         fontSize: 12, color: Colors.grey[700])),
//                                 Text('Source: $source',
//                                     style: TextStyle(
//                                         fontSize: 12, color: Colors.grey[700])),
//                               ],
//                             ),
//                             onTap: () {
//                               showDialog(
//                                 context: context,
//                                 builder: (context) {
//                                   return AlertDialog(
//                                     title: Text(title),
//                                     content: Column(
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         if (imageUrl.isNotEmpty)
//                                           Image.network(
//                                             imageUrl,
//                                             errorBuilder:
//                                                 (context, error, stackTrace) {
//                                               return Icon(
//                                                   Icons.image_not_supported,
//                                                   size: 50);
//                                             },
//                                           ),
//                                         SizedBox(height: 10),
//                                         Text(description),
//                                         SizedBox(height: 10),
//                                         Text('Author: $author'),
//                                         Text('Source: $source'),
//                                         Text('Published at: $publishedAt'),
//                                       ],
//                                     ),
//                                     actions: [
//                                       TextButton(
//                                         onPressed: () {
//                                           Navigator.of(context).pop();
//                                         },
//                                         child: Text('Close'),
//                                       ),
//                                     ],
//                                   );
//                                 },
//                               );
//                             },
//                           ),
//                         );
//                       },
//                     ),
//     );
//   }
// }
