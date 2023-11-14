import 'dart:math';

import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/widgets/app_bar_widget.dart.dart';

class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final widgetList = [
    const _SmartDownloads(),
    Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView.separated(
          padding: EdgeInsets.all(10),
          itemBuilder:(ctx,index)=>widgetList[index],
           separatorBuilder: (ctx,index)=>SizedBox(height: 30,),
            itemCount: widgetList.length)
        );
  }
}

class Section2 extends StatelessWidget {
  Section2({super.key});

  final List imageList = [
    "https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5419208/portrait/1920x7705efec6aea2564e93964b6322ee6de7d8.jpg",
    "https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5351501/portrait/1920x7709e07d3163e0f41328bc9ecb3e0ad54e6.jpg",
    "https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5379692/portrait/1920x7702258faa42539473682e3515399b0d37173697b003b284ddca66881e4c870c11b.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        const Text(
          "Introducing Downloads for you",
          textAlign: TextAlign.center,
          style: TextStyle(
              color: kwhiteColor, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        const Text(
          "we will download a personalised selection of\nmovies and shows for you, so there's\nalways something to watch on your\ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.grey, fontSize: 16),
        ),
        SizedBox(
          width: size.width,
          height: size.width,
          child: Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: size.width * 0.4,
                backgroundColor: Colors.grey.withOpacity(0.5),
              ),
              DownloadsImgaeWidget(
                imageList: imageList[0],
                margin: const EdgeInsets.only(left: 130),
                angle: 20,
              ),
              DownloadsImgaeWidget(
                imageList: imageList[1],
                margin: const EdgeInsets.only(right: 130),
                angle: -20,
              ),
              DownloadsImgaeWidget(
                imageList: imageList[2],
                margin: const EdgeInsets.only(top: 0),
              )
            ],
          ),
        ),
      ],
    );
  }
}

class Section3 extends StatelessWidget {
  const Section3({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: MaterialButton(
            color: kButtonColorBlue,
            onPressed: () {},
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            child: const Text(
              "Set up",
              style: TextStyle(
                  color: kwhiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        kHeight,
        MaterialButton(
          color: kButtonColorWhite,
          onPressed: () {},
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          child: const Text(
            "See what you can download",
            style: TextStyle(
                color: kBlackColor, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}

class _SmartDownloads extends StatelessWidget {
  const _SmartDownloads({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.settings,
          color: kwhiteColor,
        ),
        SizedBox(
          width: 10,
        ),
        Text(
          "Smart Downloads",
          style: TextStyle(fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

class DownloadsImgaeWidget extends StatelessWidget {
  const DownloadsImgaeWidget({
    Key? key,
    required this.imageList,
    this.angle = 0,
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
        margin: margin,
        width: size.width * 0.4,
        height: size.width * 0.58,
        //color: kBlackColor,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                fit: BoxFit.cover, image: NetworkImage(imageList))),
      ),
    );
  }
}
