import 'package:sl_tv/data/models/episodio.model.dart';
import 'package:sl_tv/data/models/temporada.model.dart';
import 'package:sl_tv/data/models/video_model.dart';

class Fservices {
  static List<VideoModel> ListToVideo(List<dynamic> videos) {
    List<VideoModel> nova = [];
    videos.forEach((e) {
      print(e['temporadas']);
      final novo = VideoModel(
        title: e['title'],
        thumbnail: e['thumbnail'],
        category: e['category'],
        url: e['url'],
        type: e['type'],
        description: e['description'],
        duration: e['duration'],
        author: e['author'],
      );
      novo.AddTemporadas(mapTemporadas(e['temporadas']));
      nova.add(novo);
    });
    return nova;
  }

  static List<Temporada> mapTemporadas(List<dynamic>? lista) {
    if (lista == null) return [];

    return lista.map<Temporada>((t) {
      final temporada = Temporada(
        numero: t['numero'] ?? 0,
        titulo: t['titulo'] ?? 'Temporada',
      );

      temporada.AddEpisodios(mapEpisodios(t['episodios']));

      return temporada;
    }).toList();
  }

  static List<Episodio> mapEpisodios(List<dynamic>? lista) {
    if (lista == null) return [];

    return lista.map<Episodio>((e) {
      return Episodio(
        numero: e['numero'] ?? 0,
        title: e['title'] ?? '',
        sinopse: e['sinopse'] ?? '',
        url: e['url'] ?? '',
        thumbnail: e['thumbnail'] ?? '',
      );
    }).toList();
  }
}
