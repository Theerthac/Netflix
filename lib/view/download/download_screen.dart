import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/widgets/app_bar_widget.dart.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final List imageList = [
    "https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5379692/portrait/1920x7702258faa42539473682e3515399b0d37173697b003b284ddca66881e4c870c11b.jpg",
    "https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5419208/portrait/1920x7705efec6aea2564e93964b6322ee6de7d8.jpg",
    "https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5351501/portrait/1920x7709e07d3163e0f41328bc9ecb3e0ad54e6.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView(
          children: [
            const Row(
              children: [
                Icon(
                  Icons.settings,
                  color: kwhiteColor,
                ),
                Text("Smart Downloads")
              ],
            ),
            const Text("Introducing Downloads for you"),
            const Text(
                "we will download a personalised selection of movies and shows for you, so there is always something to watch on your device"),
            Container(
              width: size.width,
              height: size.width,
              color: Colors.white,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    radius: size.width * 0.37,
                  ),
                  DownloadsImgaeWidget(imageList:imageList[0], margin: EdgeInsets.only(left: 20))
                ],
              ),
            ),
            MaterialButton(
              color: kButtonColorBlue,
              onPressed: () {},
              child: const Text(
                "Set up",
                style: TextStyle(
                    color: kwhiteColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            MaterialButton(
              color: kButtonColorWhite,
              onPressed: () {},
              child: const Text(
                "See what you can download",
                style: TextStyle(
                    color: kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ));
  }
}

class DownloadsImgaeWidget extends StatelessWidget {
  const DownloadsImgaeWidget({
    Key? key,
    required this.imageList,
    this.angle=0,
    required this.margin,
  }) : super(key: key);

  final String imageList;
  final double angle;
  final EdgeInsets margin;
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Transform.rotate(
      angle: angle * pi / 180,
      child: Container(
        margin:margin,
        width: size.width * 0.4,
        height: size.width * 0.58,
        //color: kBlackColor,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(image: NetworkImage(imageList[0]))),
      ),
    );
  }
}
