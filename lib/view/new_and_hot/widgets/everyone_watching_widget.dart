
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/home/widgets/custom_button_widget.dart';

import '../../widgets/video_widget.dart';

class EveryoneWatchingWidget extends StatelessWidget {
  const EveryoneWatchingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        kHeight,
        Text(
          "Friends",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        kHeight,
        Text(
          "This hit sitcom follows the merry misadventures of six 20-something pals as they navigate the pitfalls of work, life and love in 1990s Manhattan",
          style: TextStyle(color: Colors.grey),
        ),
        kHeight50,
        VideoWidget(),
        kHeight,
        Row(
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
