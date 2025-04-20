import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(StrikethroughApp());
}

class StrikethroughApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unicode Strikethrough',
      initialRoute: '/',
      routes: {
        '/': (context) => MainHomePage(),
        '/strikethrough': (context) => StrikethroughHomePage(),
        '/mock1': (context) => MockPage(title: 'Mock Page 1'),
        '/mock2': (context) => MockPage(title: 'Mock Page 2'),
      },
    );
  }
}

class MainHomePage extends StatelessWidget {
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

// Strikethrough Page
class StrikethroughHomePage extends StatefulWidget {
  @override
  _StrikethroughHomePageState createState() => _StrikethroughHomePageState();
}

class _StrikethroughHomePageState extends State<StrikethroughHomePage> {
  final TextEditingController _controller = TextEditingController();
  String _strikethroughText = '';

  String _toStrikethrough(String input) {
    return input.split('').map((char) => '$char\u0336').join();
  }

  void _convertText() {
    setState(() {
      _strikethroughText = _toStrikethrough(_controller.text);
    });
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _strikethroughText));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Copied to clipboard!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unicode Strikethrough')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter text'),
            ),
            SizedBox(height: 16),
            ElevatedButton(onPressed: _convertText, child: Text('Convert')),
            SizedBox(height: 24),
            SelectableText(_strikethroughText, style: TextStyle(fontSize: 20)),
            if (_strikethroughText.isNotEmpty)
              TextButton.icon(
                onPressed: _copyToClipboard,
                icon: Icon(Icons.copy),
                label: Text('Copy'),
              ),
          ],
        ),
      ),
    );
  }
}

// Generic Mock Page
class MockPage extends StatelessWidget {
  final String title;

  const MockPage({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text('This is $title', style: TextStyle(fontSize: 24)),
      ),
    );
  }
}
