import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';


class NumberCard extends StatelessWidget {
  const NumberCard({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 40,
              height: 150,
            ),
            Container(

              width: 150,
              height: 250,
              decoration: BoxDecoration(
                borderRadius: kradius20,
                image: const DecorationImage(
                    image: NetworkImage(
                     "https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5379692/portrait/1920x7702258faa42539473682e3515399b0d37173697b003b284ddca66881e4c870c11b.jpg")),
              ),
            ),
          ],
        ),
        Positioned(
            left: 13,
            bottom: -30,
            child: BorderedText(
              strokeWidth: 10.0,
              strokeColor: Colors.grey,
              child: Text(
                "${index+1}",
                style: const TextStyle(
                    fontSize: 140,
                    color: kBlackColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.none,
                    decorationColor: Colors.black),
              ),
            ))
      ],
    );
  }
}
