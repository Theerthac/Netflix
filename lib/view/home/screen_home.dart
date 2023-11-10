import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/home/widgets/number_card.dart';
import 'package:netflix/view/home/widgets/number_tile_card.dart';
import 'package:netflix/view/widgets/home_card.dart';
import 'package:netflix/view/widgets/home_title_card.dart';
import 'package:netflix/view/widgets/main_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [

          Container(
            width: double.infinity,
            height: 600,
            
            decoration: BoxDecoration(
              
              image: DecorationImage(
           
                image:NetworkImage(mainImage), ),
            ),
          ),
          HomeTitleCard(
            title: "Released in the past year",
          ),
          kHeight,
          HomeTitleCard(
            title: "Trending Now",
          ),
          kHeight,
          NumberTitleCard(),
          kHeight,
          HomeTitleCard(title: "Tense Dramas"),
          kHeight,
          HomeTitleCard(title: "South indian cinema")
        ],
      ),
    ));
  }
}
