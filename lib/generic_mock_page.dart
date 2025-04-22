import 'package:flutter/material.dart';

class MockPage extends StatelessWidget {
  final String title;

  const MockPage({super.key, required this.title});

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
