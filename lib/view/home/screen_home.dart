import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/controller/home_scrollprovider.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/service/api_endpoints.dart';
import 'package:netflix/view/home/widgets/background_card.dart';
import 'package:netflix/view/home/widgets/number_tile_card.dart';
import 'package:netflix/view/widgets/home_title_card.dart';
import 'package:provider/provider.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Consumer<HomeScrollprovider>(
          builder: (context, scrollprovider, child) {
        return NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            if (direction == ScrollDirection.reverse) {
              scrollNotifier.value = false;
            } else if (direction == ScrollDirection.forward) {
              scrollNotifier.value = true;
            }
            return true;
          },

          child: Stack(
            children: [
              ListView(
                children: const [
                  BackgroundCard(),
                  kHeight,
                  HomeTitleCard(
                    title: "Released in the past year",
                    apiUrl:ApiendPoint.popularmovies,
                  ),
                  kHeight,
                  HomeTitleCard(
                    title: "Trending Now",
                    apiUrl: ApiendPoint.trendingmovies,
                  ),
                  kHeight,
                  NumberTitleCard(),
                  kHeight,
                  HomeTitleCard(title: "Popular Shows",
                  apiUrl: ApiendPoint.populartv,

                  ),
                  kHeight,
                  HomeTitleCard(title: "Upcoming",
                  apiUrl: ApiendPoint.upcomingmovies,
                  )
                ],
              ),
              scrollprovider.isScrolling == true
                  ? AnimatedContainer(
                      duration: const Duration(milliseconds: 100),
                      width: double.infinity,
                      height: 90,
                      color: Colors.black.withOpacity(0.3),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                "https://images.ctfassets.net/4cd45et68cgf/Rx83JoRDMkYNlMC9MKzcB/2b14d5a59fc3937afd3f03191e19502d/Netflix-Symbol.png?w=700&h=456",
                                width: 30,
                                height: 30,
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
                                 child: Image.network("https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png")
                              ),
                              kWidth,
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("TV Shows", style: khometext),
                              Text(
                                "Movies",
                                style: khometext,
                              ),
                              Text(
                                "Catagories",
                                style: khometext,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  : kHeight,
            ],
          ),
        );
      },
    ));
  }
}
