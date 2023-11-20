import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/controller/bottombar_provider.dart';
import 'package:netflix/controller/download_trending.dart';
import 'package:netflix/controller/home_scrollprovider.dart';
import 'package:netflix/controller/homescreen_provider.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/controller/newandhot_provider.dart';
import 'package:netflix/controller/searchidle_provider.dart';
import 'package:netflix/controller/searchquery_provider.dart';
import 'package:netflix/controller/searchresult_provider.dart';
import 'package:netflix/controller/tvtoprate_provider.dart';
import 'package:netflix/controller/videoplayer_provider.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/view/main_page/main_page.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
       ChangeNotifierProvider(create: (context) => TrendingmovieProvider(),),
       ChangeNotifierProvider(create:(context) => SearchIDLProvider(),
        ),
        ChangeNotifierProvider(create: (context) => SearchResultProvider(),),
        ChangeNotifierProvider(create: (context) => SearchQueryProvider(),),
        ChangeNotifierProvider(create: (context) => InternetConnectivityProvider(),),
        ChangeNotifierProvider(create: (context) => NewAndHotProvider(),),
        ChangeNotifierProvider(create: (context) => VideoPlayerProvider(),),
        ChangeNotifierProvider(create: (context) => HomeBackgroundCardImageProvider(),),
        ChangeNotifierProvider(create: (context) => HomeScrollprovider(),),
        ChangeNotifierProvider(create: (context) => TvTopRateProvider(),),
        ChangeNotifierProvider(create: (context) => SelectedIndexProvider(),)
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Netlix',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Colors.transparent),
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: backgroundColor,
          fontFamily: GoogleFonts.montserrat().fontFamily,
          textTheme: const TextTheme(
            bodyLarge:TextStyle(color: Colors.white) ,
            bodyMedium: TextStyle(color: Colors.white))
        ),
        home:  MainScreen()
      ),
    );
  }
}