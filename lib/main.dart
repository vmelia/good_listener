import 'package:flutter/material.dart';

import 'pages.dart';
import 'services.dart';
import 'state.dart';

void main() {
  configureServices();
  configureState();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Good Listener', style: TextStyle(color: Colors.white)),
          backgroundColor: Colors.orange,
        ),
        body: const HomePage(),
      ),
    );
  }
}
