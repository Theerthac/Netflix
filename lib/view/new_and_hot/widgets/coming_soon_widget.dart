
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/home/widgets/custom_button_widget.dart';
import 'package:netflix/view/widgets/video_widget.dart';

class ComingSoonWidget extends StatelessWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      children: [
        const SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("FEB", style: TextStyle(fontSize: 16, color: Colors.grey)),
              Text(
                "11",
                style: TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: size.width - 50,
          height: 450,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VideoWidget(),
              kHeight,
               Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "TALLGIRL2",
                    style: TextStyle(
                        fontSize: 25,
                        letterSpacing: -3,
                        fontWeight: FontWeight.bold),
                  ),
                  Spacer(),
                  Row(
                    children: [
                      CustomButton(
                        icon: Icons.notifications_none_outlined,
                        title: "Remind me",
                        iconSize: 17,
                        textSize: 14,
                      ),
                      kWidth,
                      CustomButton(
                        icon: Icons.info,
                        title: "Info",
                        iconSize: 17,
                        textSize: 14,
                      )
                    ],
                  ),
                  kWidth,
                ],
              ),
              kHeight,
              Text("coming on Friday"),
              kHeight,
              Text(
                "Tall Girl 2",
                style: TextStyle(fontSize: 16,
                 fontWeight: FontWeight.bold),
              ),
              kHeight,
              Text(
                "Landing the lead in the school musical is a dream come true for Jodi,until the pressure sends her confidence - and her relationship - into a tailspain.",
                style: TextStyle(
                  color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
