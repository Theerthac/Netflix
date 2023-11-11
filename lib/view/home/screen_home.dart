import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/home/widgets/background_card.dart';
import 'package:netflix/view/home/widgets/number_tile_card.dart';
import 'package:netflix/view/widgets/home_title_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
      valueListenable: scrollNotifier,
      builder: (BuildContext context, index, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },
          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
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

              scrollNotifier.value== true
              ? AnimatedContainer(
                duration: Duration(milliseconds: 500),
                width: double.infinity,
                height: 90,
                color:Colors.black.withOpacity(0.3),
                child: Column(
                  children: [
                  Row(
                    children: [
                      Image.network("https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456",
                      width: 60,height: 60,
                      ),
                      const Spacer(),
                       const Icon(
                        Icons.cast,
                     color: Colors.white,
                      size: 29,
                      ),
                    kWidth,
                     Container(
                     width: 28,
                     height: 28,
                     color: Colors.blue,
                    ),
                    kWidth,
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                     Text("TV Shows",style:khometext ),
                     Text("Movies",style: khometext,),
                     Text("Catagories",style: khometext,)
                    ],
                  )

                  ],
                ),
              )
              :kHeight,

            ],
          ),
        );
      },
    ));
  }
}
