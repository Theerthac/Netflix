import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/view/home/widgets/custom_button_widget.dart';
import 'package:netflix/view/widgets/video_widget.dart';


class EveryoneWatchingInfoCard extends StatelessWidget {
  const EveryoneWatchingInfoCard({super.key, required this.movieinfo});
  final MovieinfoModel movieinfo;

  @override
  Widget build(BuildContext context) {
    String imageUrl =
        "https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=2f9518d11e1fc9457743e722af86ac50";
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight,
        Text(
          movieinfo.originalTitle ?? "No Title Found",
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        kHeight,
        Text(
          movieinfo.overview ?? "no",
          style: const TextStyle(
            color: Colors.grey,
          ),
        ),

        kHeight50,
        VideoWidget(videoImage: imageUrl),
        const Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            CustomButton(
              icon: Icons.share,
              title: "Share",
              iconSize: 23,
              textSize: 16,
            ),
            kWidth,
            CustomButton(
              icon: Icons.add,
              title: "My List",
              iconSize: 23,
              textSize: 16,
            ),
            kWidth,
            CustomButton(
              icon: Icons.play_arrow,
              title: "Play",
              iconSize: 23,
              textSize: 16,
            ),
            kWidth,
          ],
        )
      ],
    );
  }
}
