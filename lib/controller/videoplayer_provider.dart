import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerprovider extends ChangeNotifier {
  late VideoPlayerController videoPlayerController;


  VideoPlayerState(String videoUrl) {
    // ignore: non_constant_identifier_names
    late var VideoUrlvar = Uri.parse(videoUrl);
    videoPlayerController = VideoPlayerController.networkUrl(VideoUrlvar)
      ..initialize().then((_) {
        videoPlayerController.play();
        notifyListeners();
      });
  }

  void videoPause() {
    videoPlayerController.pause();
    notifyListeners();
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    super.dispose();
  }
}
