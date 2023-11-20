import 'package:flutter/material.dart';
import 'package:netflix/controller/homescreen_provider.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/home/widgets/custom_button_widget.dart';
import 'package:provider/provider.dart';

class BackgroundCard extends StatefulWidget {
  const BackgroundCard({super.key});

  @override
  State<BackgroundCard> createState() => _BackgroundCardState();
}

class _BackgroundCardState extends State<BackgroundCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeBackgroundCardImageProvider>(context, listen: false)
        .initialBackgroundCard();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var imageProvider = Provider.of<HomeBackgroundCardImageProvider>(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: size.height * 0.7,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageProvider.imageUrl ?? "Image not found"),
            ),
          ),
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const CustomButton(icon: Icons.add, title: "My List"),
                playButton(),
                const CustomButton(icon: Icons.info, title: "info")
              ],
            ),
          ),
        )
      ],
    );
  }

  TextButton playButton() {

    return TextButton.icon(
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(kwhiteColor)),
        icon: const Icon(
          Icons.play_arrow,
          size: 25,
          color: kBlackColor,
        ),
        label: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "Play",
            style: TextStyle(fontSize: 20, color: kBlackColor),
          ),
        ));
  }
}
