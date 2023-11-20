import 'package:flutter/material.dart';

import 'package:netflix/constants/constants.dart';

class AppBarWidget extends StatelessWidget {
  const AppBarWidget({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kWidth,
        Text(
          title,
          style: const TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        const Icon(
          Icons.cast,
          color: Colors.white,
          size: 29,
        ),
        kWidth,
        SizedBox(
          width: 28,
          height: 28,
            child: Image.network("https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png"),
        ),
        kWidth,
      ],
    );
  }
}
