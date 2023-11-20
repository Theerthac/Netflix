
import 'package:flutter/material.dart';
import 'package:netflix/controller/download_trending.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/fast_laughs/widgets/fast_laugh_video_player.dart';
import 'package:provider/provider.dart';

final dummyVideoUrls = [
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/VolkswagenGTIReview.mp4",
  "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4"
];

class VideoList extends StatefulWidget {
  final int index;
  const VideoList({super.key, required this.index});

  @override
  State<VideoList> createState() => _VideoListState();
}

class _VideoListState extends State<VideoList> {
  @override
  void initState() {
    super.initState();
    Provider.of<TrendingmovieProvider>(context, listen: false)
        .initializeImage();

    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    final videoUrl = dummyVideoUrls[widget.index % dummyVideoUrls.length];
    return Consumer<TrendingmovieProvider>(
      builder: (context, value, child) {
      if (value.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Stack(
        children: [
          FastLaughVideoPlayer(videoUrl: videoUrl),
          
             Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 27,
                    backgroundColor: Colors.black.withOpacity(0.5),
                    child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.volume_off,
                          color: kwhiteColor,
                          size: 30,
                        )),
                  ),

                   value.imagelist.isEmpty? const SizedBox()
                  :  Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: CircleAvatar(
                            radius: 27,
                            backgroundImage: NetworkImage(
                              value.imagelist[widget.index],
                            ),
                          ),
                        ),
                        const VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                        const VideoActions(icon: Icons.add, title: 'My List'),
                        const VideoActions(icon: Icons.share, title: 'Share'),
                        const VideoActions(icon: Icons.play_arrow, title: 'Play'),
                      ]),
                ],
              ),
            ),
          
        ],
      );
    });
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 25,
          ),
          Text(
            title,
            style: const TextStyle(color: kwhiteColor, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
