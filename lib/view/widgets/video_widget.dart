
import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';

class VideoWidget extends StatelessWidget {
  final String? videoImage;
  const VideoWidget({
    super.key,
     required this.videoImage,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: 200,
          child: Image.network(
            '$videoImage',
            fit: BoxFit.fill,
          ),
        ),
        Positioned(
          bottom: 0,
          right: 10,
          child: CircleAvatar(
            radius: 24,
            backgroundColor: Colors.black.withOpacity(0.5),
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.volume_off,
                  color: kwhiteColor,
                  size: 22,
                )),
          ),
        ),
      ],
    );
  }
}
