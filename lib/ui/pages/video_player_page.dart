import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sl_tv/ui/widgets/topButtons.dart';
import 'package:video_player/video_player.dart';
import '../widgets/video_player_widget.dart';

class VideoPlayerPage extends StatefulWidget {
  final String videoUrl;

  const VideoPlayerPage({super.key, required this.videoUrl});

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  late VideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

    controller = VideoPlayerController.networkUrl(Uri.parse(widget.videoUrl))
      ..initialize().then((_) {
        controller.play();
        setState(() {});
      });
  }

  @override
  void dispose() {
    controller.dispose();

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!controller.value.isInitialized) {
      return const Scaffold(
        backgroundColor: Colors.black,
        body: Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Center(child: VideoPlayerWidget(controller: controller)),

          // 📋 Botões topo direito
          Positioned(
            top: 32,
            right: 16,
            child: Row(
              children: [
                TopButton(icon: Icons.list),
                const SizedBox(width: 8),
                TopButton(icon: Icons.skip_next, text: 'Próximo episódio'),
              ],
            ),
          ),

          // ▶️ Play / Pause central
          Center(
            child: IconButton(
              icon: Icon(
                controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                color: Colors.red,
                size: 64,
              ),
              onPressed: () {
                setState(() {
                  controller.value.isPlaying
                      ? controller.pause()
                      : controller.play();
                });
              },
            ),
          ),

          // 📊 Barra de progresso REAL
          ValueListenableBuilder(
            valueListenable: controller,
            builder: (context, VideoPlayerValue value, child) {
              final duration = value.duration.inMilliseconds;
              final position = value.position.inMilliseconds;

              final progress = duration > 0 ? position / duration : 0.0;

              return Positioned(
                bottom: 32,
                left: 16,
                right: 16,
                child: Container(
                  height: 4,
                  decoration: BoxDecoration(
                    color: Colors.white24,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: FractionallySizedBox(
                    widthFactor: progress.clamp(0.0, 1.0),
                    alignment: Alignment.centerLeft,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),

          // 🔙 Voltar
          Positioned(
            top: 32,
            left: 16,
            child: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.red),
              onPressed: () => Navigator.pop(context),
            ),
          ),
        ],
      ),
    );
  }
}
