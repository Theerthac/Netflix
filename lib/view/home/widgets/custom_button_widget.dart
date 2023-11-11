import 'package:flutter/material.dart';
import 'package:netflix/helpers/colors/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key, required this.icon, required this.title,
  });
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: kwhiteColor,
          size: 40,
        ),
        Text(
          title,
          style: const TextStyle(fontSize: 18),
        )
      ],
    );
  }
}
