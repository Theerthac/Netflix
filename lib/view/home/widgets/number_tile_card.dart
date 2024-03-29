import 'package:flutter/material.dart';
import 'package:netflix/constants/constants.dart';
import 'package:netflix/controller/tvtoprate_provider.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/view/home/widgets/number_card.dart';
import 'package:netflix/view/widgets/main_title.dart';
import 'package:provider/provider.dart';

class NumberTitleCard extends StatefulWidget {
  const NumberTitleCard({
    super.key,
  });

  @override
  State<NumberTitleCard> createState() => _NumberTitleCardState();
}

class _NumberTitleCardState extends State<NumberTitleCard> {
  @override
  void initState() {
    super.initState();
    Provider.of<TvTopRateProvider>(context, listen: false)
        .fetchTvTopeRateMovies();
  }

  @override
  Widget build(BuildContext context) {
    List imagelist = [];
    return Consumer<TvTopRateProvider>(builder: (context, provider, child) {
      if (provider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (provider.tvtopRate.isEmpty) {
        return const Text("No data available");
      }
      imagelist = provider.tvtopRate.map((MovieinfoModel movieinfo) {
        if (movieinfo.posterpath == null) {
          return null;
        }

        String imageUrl =
            'https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=b2dee3b855c4ea705ff5dda3c0201768';
        return imageUrl;
      }).toList();

      if (imagelist.isEmpty) {
        return const Center(
          child: ListTile(title: Text('No Movies found')),
        );
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const MainTitle(title: "Top 10 Tv shows In India Today"),
          kHeight,
          LimitedBox(
            maxHeight: 200,
            child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(
                  10,
                  (index) => NumberCard(
                    index: index,
                    imageUrl: imagelist[index],
                  ),
                )),
          )
        ],
      );
    });
  }
}
