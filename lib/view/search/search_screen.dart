import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/search/widget/search_idle.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CupertinoSearchTextField(
                backgroundColor: Colors.grey.withOpacity(0.4),
                prefixIcon: Icon(CupertinoIcons.search,color: Colors.grey,),
                suffixIcon: Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
                style: TextStyle(color: Colors.white),
              ),
              kHeight,
              
             Expanded(child: SearchIdle()),
              
            ],
          ),
        )
      )
    );
  }
}
