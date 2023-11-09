import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/view/search/widget/search_idle.dart';
import 'package:netflix/view/search/widget/search_reasult.dart';

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
                prefixIcon: const Icon(CupertinoIcons.search,color: Colors.grey,),
                suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,color: Colors.grey,),
                style: const TextStyle(color: Colors.white),
              ),
              kHeight,
              
            // const Expanded(child: SearchIdle()),
             const Expanded(child: SearchResult()),
            ],
          ),
        )
      )
    );
  }
}
