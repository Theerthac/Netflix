
import 'package:flutter/material.dart';
import 'package:netflix/view/download/widgets/widgets.dart';
import 'package:netflix/view/widgets/app_bar_widget.dart.dart';


class DownloadScreen extends StatelessWidget {
  DownloadScreen({super.key});

  final widgetList = [
    const SmartDownloads(),
    const Section2(),
    const Section3(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: AppBarWidget(
              title: "Downloads",
            )),
        body: ListView.separated(
          padding: const EdgeInsets.all(10),
          itemBuilder:(ctx,index)=>widgetList[index],
           separatorBuilder: (ctx,index)=>const SizedBox(height: 30,),
            itemCount: widgetList.length)
        );
  }
}

