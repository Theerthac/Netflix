import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/controller/searchidle_provider.dart';
import 'package:netflix/helpers/colors/colors.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/view/search/widget/searchtitle.dart';
import 'package:provider/provider.dart';


class SearchIdle extends StatefulWidget {
  const SearchIdle({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchIdle> createState() => _SearchIdleState();
}

class _SearchIdleState extends State<SearchIdle> {
  @override
  void initState() {
    super.initState();
    Provider.of<SearchIDLProvider>(context, listen: false)
        .fetchSearchIDLMovies();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(title: 'Top Searches'),
        kHeight,
        Expanded(
          child: Consumer<SearchIDLProvider>(
            builder: (context, value, child) {
              if (value.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (value.trendingMovies.isEmpty) {
                return const Text("No data available");
              }
              return ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) =>
                    TopSearchItemTile(movieinfo: value.trendingMovies[index]),
                separatorBuilder: (context, index) => kHeight20,
                itemCount: value.trendingMovies.length,
              );
            },
          ),
        )
      ],
    );
  }
}

class TopSearchItemTile extends StatelessWidget {
  final MovieinfoModel movieinfo;
  const TopSearchItemTile({super.key, required this.movieinfo});

  @override
  Widget build(BuildContext context) {
    final screenwidth = MediaQuery.of(context).size.width;
    String url =
        'https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=2f9518d11e1fc9457743e722af86ac50';
    return Row(
      children: [
       Container(
          width: screenwidth * 0.35,
          height: 80,
          decoration: BoxDecoration(
              image:
                  DecorationImage(fit: BoxFit.fill, image: NetworkImage(url))),
        ),
        kWidth,
        Expanded(
          child: Text(
            movieinfo.title ?? "No Movie Name Found",
            style: const TextStyle(
                color: kwhiteColor, fontWeight: FontWeight.bold, fontSize: 16),
          ),
        ),
        const CircleAvatar(
          backgroundColor: kwhiteColor,
          radius: 25,
          child: CircleAvatar(
            backgroundColor: Colors.black,
            radius: 23,
            child: Icon(
              CupertinoIcons.play_fill,
              color: kwhiteColor,
            ),
          ),
        )
       
      ],
    );
  }
}
