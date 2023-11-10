import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';

class VideoList extends StatelessWidget {
  final int index;
  const VideoList({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[index % Colors.accents.length],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
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
                      icon: Icon(Icons.volume_off,
                      color: kwhiteColor,
                      size: 30,
                      )),
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircleAvatar(
                        radius: 27,
                        backgroundImage: NetworkImage("https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5379692/portrait/1920x7702258faa42539473682e3515399b0d37173697b003b284ddca66881e4c870c11b.jpg",),
                      ),
                    ),
                   VideoActions(icon: Icons.emoji_emotions, title: 'LOL'),
                    VideoActions(icon: Icons.add, title: 'My List'),
                     VideoActions(icon: Icons.share, title: 'Share'),
                      VideoActions(icon: Icons.play_arrow, title: 'Play'),
               ] ),
        ],
            ),
          ),
        )
      ],
    );
  }
}

class VideoActions extends StatelessWidget {
  final IconData icon;
  final String title;
  const VideoActions({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
      child: Column(
        children: [
          Icon(icon,color: Colors.white,
          size: 25,),
          Text(title,style: TextStyle(color: kwhiteColor,fontSize: 16),),
        ],
      ),
    );
  }
}
