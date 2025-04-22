import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:learning_flutter/emoji_home_page.dart';
import 'package:learning_flutter/generic_mock_page.dart';
import 'package:learning_flutter/strikethrough_home_page.dart';

void main() {
  runApp(StrikethroughApp());
}

class StrikethroughApp extends StatelessWidget {
  const StrikethroughApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unicode Strikethrough',
      initialRoute: '/',
      routes: {
        '/': (context) => MainHomePage(),
        '/strikethrough': (context) => StrikethroughHomePage(),
        '/emoji': (context) => MockPage(title: 'Mock Page 1'),
        '/mock2': (context) => MockPage(title: 'Mock Page 2'),
      },
    );
  }
}

class MainHomePage extends StatelessWidget {
  const MainHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Main Home Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: Text('Go to Strikethrough Generator'),
              onPressed: () => Navigator.pushNamed(context, '/strikethrough'),
            ),
            ElevatedButton(
              child: Text('Go to Mock Page 1'),
              onPressed: () => Navigator.pushNamed(context, '/mock1'),
            ),
            ElevatedButton(
              child: Text('Go to Mock Page 2'),
              onPressed: () => Navigator.pushNamed(context, '/mock2'),
            ),
          ],
        ),
      ),
    );
  }
}
