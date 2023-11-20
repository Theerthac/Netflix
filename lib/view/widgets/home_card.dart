import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';

class HomeCard extends StatelessWidget {
  final String imageUrlFromApi;
  const HomeCard({super.key, required this.imageUrlFromApi});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 250,
      decoration: BoxDecoration(
        borderRadius: kradius20,
        image:  DecorationImage(
          fit: BoxFit.cover,
            image: NetworkImage(
                imageUrlFromApi)),
      ),
    );
  }
}
