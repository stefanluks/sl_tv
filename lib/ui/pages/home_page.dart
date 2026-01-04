import 'package:flutter/material.dart';
import 'package:sl_tv/data/video_mock.dart';
import '../widgets/category_row.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = {
      'Em alta': videosMock.where((v) => v.category == 'Em alta').toList(),
      'Recomendados': videosMock
          .where((v) => v.category == 'Recomendados')
          .toList(),
      'Novos': videosMock.where((v) => v.category == 'Novos').toList(),
    };

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        title: const Text(
          'SL TV',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: ListView(
        children: categories.entries.map((entry) {
          return CategoryRow(title: entry.key, videos: entry.value);
        }).toList(),
      ),
    );
  }
}
