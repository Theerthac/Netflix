import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/controller/searchresult_provider.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/api_key.dart';
import 'package:netflix/view/search/widget/searchtitle.dart';
import 'package:provider/provider.dart';



class SearchResult extends StatefulWidget {
  final String apiQuery;
  const SearchResult({super.key, required this.apiQuery});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  @override
  void initState() {
    super.initState();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SearchTextTitle(
          title: 'Movies & TV',
        ),
        kHeight,
        Expanded(child:
            Consumer<SearchResultProvider>(
              builder: (context, provider, child) {
           Provider.of<SearchResultProvider>(context,listen: false).fetchSearchResult(context, widget.apiQuery);
          return GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 1 / 1.4,
              children:
                  List.generate(provider.searchResultMovies.length, (index) {
                MovieinfoModel movieinfo = provider.searchResultMovies[index];
                if (movieinfo.posterpath != null) {
                  String imageUrl =
                      'https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=$apikey';
                  return MainCard(imageUrl: imageUrl);
                }
                return const SizedBox();
              }));
        }))
      ],
    );
  }
}

class MainCard extends StatelessWidget {
  final String imageUrl;
  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(7)),
    );
  }
}
