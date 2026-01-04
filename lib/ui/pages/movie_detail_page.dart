import 'package:flutter/material.dart';
import 'package:sl_tv/data/models/video_model.dart';

class MovieDetailPage extends StatelessWidget {
  final VideoModel filme;

  const MovieDetailPage({super.key, required this.filme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        title: Text(
          filme.title,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Banner / Capa
            Image.network(
              filme.thumbnail,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                filme.title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            const SizedBox(height: 12),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                filme.duration +
                    " - [ " +
                    filme.author +
                    " ]\n" +
                    filme.description,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 203, 39, 28),
                  minimumSize: const Size(double.infinity, 48),
                ),
                icon: const Icon(Icons.play_arrow, color: Colors.white),
                label: const Text(
                  'Assistir',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  // futuramente: player de vídeo
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
