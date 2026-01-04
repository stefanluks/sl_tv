import 'package:sl_tv/data/models/temporada.model.dart';

class VideoModel {
  final String title;
  final String thumbnail;
  final String category;
  final String url;
  final String type;
  final String description;
  final String duration;
  final String author;
  List<Temporada> temporadas = [];

  VideoModel({
    required this.title,
    required this.thumbnail,
    required this.category,
    required this.url,
    required this.type,
    required this.description,
    required this.duration,
    required this.author,
  });

  void AddTemporadas(List<Temporada> lista) {
    temporadas = lista;
  }
}
