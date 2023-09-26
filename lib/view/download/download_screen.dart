import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/widgets/app_bar_widget.dart.dart';

class DownloadScreen extends StatelessWidget {
   DownloadScreen({super.key});

  final List imageList = [
    
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
                  Container(
                    width: size.width * 0.4,
                    height: size.width * 0.58,
                    color: kBlackColor,
                  )
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
