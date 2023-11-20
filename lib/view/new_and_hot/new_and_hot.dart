import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/new_and_hot/widgets/coming_soon_widget.dart';
import 'package:netflix/view/new_and_hot/widgets/everyone_watching_widget.dart';

class NewAndHotScreen extends StatelessWidget {
  const NewAndHotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: AppBar(
              title: const Text(
                "New & Hot",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
              ),
              actions: [
                const Icon(
                  Icons.cast,
                  color: Colors.white,
                  size: 29,
                ),
                kWidth,
                SizedBox(
                  width: 28,
                  height: 18,
                  child: Image.network(
                      "https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png"),
                ),
                kWidth,
              ],
              bottom: TabBar(
                  unselectedLabelColor: kwhiteColor,
                  labelColor: kBlackColor,
                  isScrollable: true,
                  labelStyle: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                  indicator: BoxDecoration(
                      color: kwhiteColor, borderRadius: kradius30),
                  tabs: const [
                    Tab(
                      text: "🍿Coming Soon",
                    ),
                    Tab(
                      text: "👀 Everyone's watching",
                    )
                  ]),
            ),
          ),
          body: TabBarView(children: [
            _buildComingSoon(context),
            buildEveryoneWatching(),
          ])),
    );
  }
}

Widget _buildComingSoon(BuildContext context) {
  return const ComingSoonWidget();
}

Widget buildEveryoneWatching() {
  return const EveryoneWatchingWidget();
}
