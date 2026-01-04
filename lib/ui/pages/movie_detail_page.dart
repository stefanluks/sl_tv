import 'package:flutter/material.dart';
import 'package:sl_tv/data/models/temporada.model.dart';
import 'package:sl_tv/data/models/video_model.dart';
import 'package:sl_tv/ui/pages/video_player_page.dart';
import 'package:sl_tv/ui/widgets/dropdown.dart';

class MovieDetailPage extends StatefulWidget {
  final VideoModel filme;

  const MovieDetailPage({super.key, required this.filme});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  Temporada? temporadaSelecionada;

  @override
  void initState() {
    super.initState();

    if (widget.filme.temporadas.isNotEmpty) {
      temporadaSelecionada = widget.filme.temporadas.first;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 35, 35, 35),
        title: Text(
          widget.filme.title,
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
              widget.filme.thumbnail,
              width: double.infinity,
              height: 220,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.filme.title,
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
                widget.filme.duration +
                    " - [ " +
                    widget.filme.author +
                    " ]\n" +
                    widget.filme.description,
                style: const TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),

            const SizedBox(height: 24),

            if (widget.filme.type == "filme")
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) =>
                            VideoPlayerPage(videoUrl: widget.filme.url),
                      ),
                    );
                  },
                ),
              ),

            if (widget.filme.type != "filme") const Divider(),

            if (widget.filme.type != "filme")
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DropdownTemporada(
                      opcoes: widget.filme.temporadas,
                      selecionada: temporadaSelecionada,
                      onChanged: (t) {
                        setState(() {
                          temporadaSelecionada = t;
                        });
                      },
                    ),
                    IconButton(
                      onPressed: () {},
                      color: Colors.white,
                      icon: Icon(Icons.arrow_downward),
                    ),
                  ],
                ),
              ),

            if (temporadaSelecionada != null)
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: temporadaSelecionada!.episodios.length,
                itemBuilder: (context, index) {
                  final ep = temporadaSelecionada!.episodios[index];

                  return ListTile(
                    leading: Image.network(
                      ep.thumbnail == ""
                          ? widget.filme.thumbnail
                          : ep.thumbnail,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                    title: Text(
                      'E${ep.numero} - ${ep.title}',
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      ep.sinopse,
                      maxLines: 2, // limita a altura
                      overflow: TextOverflow.ellipsis, // corta o texto
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12, // menor na vertical
                        height: 1.2, // controla espaçamento entre linhas
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => VideoPlayerPage(videoUrl: ep.url),
                        ),
                      );
                    },
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
