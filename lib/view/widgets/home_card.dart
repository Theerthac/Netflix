
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 150,
     height: 250,
     decoration: BoxDecoration(
       borderRadius: kradius20,
       image: const DecorationImage(image: NetworkImage("https://akamaividz2.zee5.com/image/upload/w_231,h_347,c_scale,f_webp,q_auto:eco/resources/0-0-1z5379692/portrait/1920x7702258faa42539473682e3515399b0d37173697b003b284ddca66881e4c870c11b.jpg")),
     ),
    );
  }
}
