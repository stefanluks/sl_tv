import 'package:flutter/material.dart';
import 'package:sl_tv/ui/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '📺 SL TV',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 14, 5, 30)),
      ),
      home: const HomePage(),
    );
  }
}
