import 'package:sl_tv/data/models/video_model.dart';

class Fservices {
  // ignore: non_constant_identifier_names
  static List<VideoModel> ListToVideo(List<dynamic> videos) {
    List<VideoModel> nova = [];
    print(videos);
    videos.forEach((e) {
      nova.add(
        VideoModel(
          title: e['title'],
          thumbnail: e['thumbnail'],
          category: e['category'],
          url: e['url'],
          type: e['type'],
          description: e['description'],
          duration: e['duration'],
          author: e['author'],
        ),
      );
    });
    return nova;
  }
}
