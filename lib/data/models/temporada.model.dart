import 'package:sl_tv/data/models/episodio.model.dart';

class Temporada {
  final int numero;
  final String titulo;
  List<Episodio> episodios = [];

  Temporada({required this.numero, required this.titulo});

  void AddEpisodios(List<Episodio> lista) {
    episodios = lista;
  }
}
