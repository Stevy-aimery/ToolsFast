import 'package:flutter/material.dart';
// import 'package:toolsfast/pages/bottom_nav.dart';
import 'package:toolsfast/pages/started.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TOOLSFAST',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: const BottomNav(),
      home: const Started(),
    );
  }
}
