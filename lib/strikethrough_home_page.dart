import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StrikethroughHomePage extends StatefulWidget {
  const StrikethroughHomePage({super.key});

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
              maxLines: null,
              keyboardType: TextInputType.multiline,
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
