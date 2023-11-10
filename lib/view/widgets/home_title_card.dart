import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/widgets/home_card.dart';
import 'package:netflix/view/widgets/main_title.dart';

class HomeTitleCard extends StatelessWidget {
  const HomeTitleCard({
    super.key, required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       MainTitle(
          title: title,
        ),
        kHeight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(10, (index) {
                return HomeCard();
              })),
        )
      ],
    );
  }
}
