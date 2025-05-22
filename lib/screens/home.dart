import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: const GridScreen(),
    );
  }
}

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  final List<Map<String, String>> routes = const [
    {'title': 'Strikethrough', 'route': '/strikethrough'},
    {'title': 'Cursive', 'route': '/cursive'},
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        childAspectRatio: 3 / 2,
        children: routes.map((item) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, item['route']!);
            },
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  item['title']!,
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
