import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> article;

  const DetailScreen({Key? key, required this.article}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Article Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              article['title']!,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text('By ${article['author']}'),
            const SizedBox(height: 10),
            Text('Source: ${article['source']}'),
            const SizedBox(height: 10),
            Text('Published: ${article['time']}'),
            const SizedBox(height: 10),
            Image.network(article['imageUrl']!),
            const SizedBox(height: 10),
            Text(
              article['description']!,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}