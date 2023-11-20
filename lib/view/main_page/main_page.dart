import 'package:flutter/material.dart';
import 'package:netflix/controller/bottombar_provider.dart';
import 'package:netflix/view/download/download_screen.dart';
import 'package:netflix/view/fast_laughs/fast_laughs.dart';
import 'package:netflix/view/home/screen_home.dart';
import 'package:netflix/view/main_page/widgets/bottom_nav.dart';
import 'package:netflix/view/new_and_hot/new_and_hot.dart';
import 'package:netflix/view/search/search_screen.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final pages = [
    const HomeScreen(),
    const NewAndHotScreen(),
    const FastLaughsScreen(),
    const SearchScreen(),
    DownloadScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer<SelectedIndexProvider>(
          builder: (context, provider, _) {
            return provider.selectedIndex < pages.length
                ? pages[provider.selectedIndex]
                : const Center(
                    child: Text("Not Found"),
                  );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavigationWidgets(),
    );
  }
}
