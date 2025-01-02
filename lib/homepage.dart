import 'dart:convert';
import 'package:flutter/material.dart';
import 'detail_screen.dart';

class HomeScreen extends StatelessWidget {
  final String jsonData = '''
  {
  "status": "ok",
  "totalResults": 2,
  "articles": [
    {
      "source": {
        "id": null,
        "name": "CounterPunch"
      },
      "author": "Jeffrey St. Clair",
      "title": "Hell and High Water: the Year in Climate Chaos",
      "description": "2024 will be the warmest year on record...",
      "url": "https://www.counterpunch.org/2024/12/20/hell-and-high-water-the-year-in-climate-chaos/",
      "urlToImage": "https://www.counterpunch.org/wp-content/uploads/2024/12/flaglongview-scaled.jpeg",
      "publishedAt": "2024-12-20T06:59:11Z",
      "content": "Industrial plants, Port of Longview..."
    },
    {
      "source": {
        "id": null,
        "name": "Neuwritesd.org"
      },
      "author": "Vani Taluja",
      "title": "A 3D Camera for the Brain: The Simplified Science of MRI",
      "description": "Have you ever dreamed of having Superman’s power of “X-Ray Vision,” or the ability to see through solid objects? While it is uncertain if this superpower was their motivation, medical researchers and physical scientists in the 1970s were able to turn this dre…",
      "url": "https://neuwritesd.org/2024/12/19/a-3d-camera-for-the-brain-the-simplified-science-of-mri/",
      "urlToImage": "https://neuwritesd.org/wp-content/uploads/2024/12/mris.jpeg?w=1200",
      "publishedAt": "2024-12-20T04:52:29Z",
      "content": "Posted by Vani Taluja on December 19, 2024 in NeuWrite, Physics and Neuroscience | Leave a comment. Have you ever dreamed of having Supermans power of X-Ray Vision, or the ability to see through soli… [+10475 chars]"
     }
    ]
  }
  ''';
  List<Map<String, dynamic>> parseArticles(String jsonData) {
    final data = json.decode(jsonData);
    return List<Map<String, dynamic>>.from(data['articles']);
  }

  @override
  Widget build(BuildContext context) {
    final articles = parseArticles(jsonData);

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/'); // Home
              break;
            case 1:
              Navigator.pushNamed(context, '/search');
              break;
            case 2:
              Navigator.pushNamed(context, '/saved');
              break;
          }
        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Saved'),
        ],
      ),
      appBar: AppBar(
        title: const Text('NewsApp'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Tech category selected')),
                    );
                  },
                  child: const Text('Tech'),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Sports category selected')),
                    );
                  },
                  child: const Text('Sports'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle Cinema Category
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Cinema category selected')),
                    );
                  },
                  child: const Text('Cinema'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: articles.length,
              itemBuilder: (context, index) {
                final article = articles[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(
                          article: {
                            'title': article['title'],
                            'author': article['author'] ?? 'Unknown',
                            'source': article['source']['name'],
                            'time': article['publishedAt'],
                            'imageUrl': article['urlToImage'] ?? '',
                            'description': article['description'] ?? '',
                          },
                        ),
                      ),
                    );
                  },
                  child: Card(
                    margin: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Image.network(
                        article['urlToImage'] ?? '',
                        fit: BoxFit.cover,
                        width: 100,
                        height: 100,
                      ),
                      title: Text(article['title'] ?? 'No Title'),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(article['source']['name'] ?? 'Unknown Source'),
                          const SizedBox(height: 5),
                          Text(article['publishedAt'] ?? 'Unknown Date'),
                        ],
                      ),
                      isThreeLine: true,
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
