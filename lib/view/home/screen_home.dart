import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/home/widgets/number_tile_card.dart';
import 'package:netflix/view/widgets/home_title_card.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [

          Stack(
            children: [
              Container(
                width: double.infinity,
                height: 600,
                
                decoration: const BoxDecoration(
                  
                  image: DecorationImage(
                 fit: BoxFit.cover,
                    image:NetworkImage(mainImage), ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                 TextButton.icon(
                  onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(kwhiteColor)
                  ),
                   icon: const Icon(Icons.play_arrow,
                   size: 25,
                   color: kBlackColor,), 
                   label: const Padding(
                     padding: EdgeInsets.symmetric(horizontal: 10),
                     child: Text("Play",style: TextStyle(fontSize: 20,color: kBlackColor),),
                   ))
                  ],
                ),
              )
            ],
          ),
          const HomeTitleCard(
            title: "Released in the past year",
          ),
          kHeight,
          const HomeTitleCard(
            title: "Trending Now",
          ),

          kHeight,
          const NumberTitleCard(),
          kHeight,
          const HomeTitleCard(title: "Tense Dramas"),
          kHeight,
          const HomeTitleCard(title: "South indian cinema")
        ],
      ),
    ));
  }
}
