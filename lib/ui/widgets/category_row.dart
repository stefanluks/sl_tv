import 'package:flutter/material.dart';
import 'package:sl_tv/data/models/video_model.dart';
import 'package:sl_tv/ui/pages/movie_detail_page.dart';
import 'video_card.dart';

class CategoryRow extends StatelessWidget {
  final String title;
  final List<VideoModel> videos;

  const CategoryRow({super.key, required this.title, required this.videos});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return VideoCard(
                title: video.title,
                thumbnail: video.thumbnail,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieDetailPage(filme: video),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
