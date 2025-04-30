import 'package:flutter/material.dart';
import 'package:strikethrough_app_flutter/cursive_converter.dart';
import 'package:strikethrough_app_flutter/generic_mock_page.dart';
import 'package:strikethrough_app_flutter/strikethrough_home_page.dart';

void main() {
  runApp(const StrikethroughApp());
}

class StrikethroughApp extends StatelessWidget {
  const StrikethroughApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unicode Strikethrough',
      initialRoute: '/',
      routes: {
        '/': (context) => const MainHomePage(),
        '/strikethrough': (context) => const StrikethroughHomePage(),
        '/cursive': (context) => const CursiveConverter(),
        '/mock1': (context) => const MockPage(title: 'Mock Page 1'),
        '/mock2': (context) => const MockPage(title: 'Mock Page 2'),
      },
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Main Home Page')),
      body: const GridScreen(),
    );
  }
}

class GridScreen extends StatelessWidget {
  const GridScreen({super.key});

  final List<Map<String, String>> routes = const [
    {'title': 'Strikethrough', 'route': '/strikethrough'},
    {'title': 'Cursive', 'route': '/cursive'},
    {'title': 'Mock Page 1', 'route': '/mock1'},
    {'title': 'Mock Page 2', 'route': '/mock2'},
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
        children:
            routes.map((item) {
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
