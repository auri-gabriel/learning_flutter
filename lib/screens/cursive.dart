import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CursiveConverterScreen extends StatefulWidget {
  const CursiveConverterScreen({super.key});

  @override
  _CursiveConverterScreenState createState() => _CursiveConverterScreenState();
}

class _CursiveConverterScreenState extends State<CursiveConverterScreen> {
  final TextEditingController _controller = TextEditingController();
  String _cursiveText = '';

  String _toCursive(String input) {
    final buffer = StringBuffer();

    for (var rune in input.runes) {
      if (rune >= 0x41 && rune <= 0x5A) {
        // A-Z
        buffer.writeCharCode(rune - 0x41 + 0x1D4D0);
      } else if (rune >= 0x61 && rune <= 0x7A) {
        // a-z
        buffer.writeCharCode(rune - 0x61 + 0x1D4EA);
      } else {
        buffer.writeCharCode(rune);
      }
    }

    return buffer.toString();
  }

  void _convertText() {
    setState(() {
      _cursiveText = _toCursive(_controller.text);
    });
  }

  void _copyToClipboard() {
    Clipboard.setData(ClipboardData(text: _cursiveText));
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text('Copied to clipboard!')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Unicode Cursive')),
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
            SelectableText(_cursiveText, style: TextStyle(fontSize: 20)),
            if (_cursiveText.isNotEmpty)
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
