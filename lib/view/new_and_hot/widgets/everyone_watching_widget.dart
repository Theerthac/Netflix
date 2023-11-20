import 'package:flutter/material.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/controller/newandhot_provider.dart';
import 'package:netflix/view/new_and_hot/widgets/EveryonesWatchingInfo_Card.dart';
import 'package:provider/provider.dart';



class EveryoneWatchingWidget extends StatefulWidget {
  const EveryoneWatchingWidget({
    super.key,
  });

  @override
  State<EveryoneWatchingWidget> createState() => _EveryoneWatchingWidgetState();
}

class _EveryoneWatchingWidgetState extends State<EveryoneWatchingWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewAndHotProvider>(context, listen: false)
        .fetchEveryoneWatchingMovies();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewAndHotProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (provider.moviepopular.isEmpty) {
          return const Text("No data available");
        }
        return ListView.builder(
          shrinkWrap: true,
          itemCount: provider.moviepopular.length,
          itemBuilder: (context, index) =>
              EveryoneWatchingInfoCard(movieinfo: provider.moviepopular[index]),
        );
      },
    );
  }
}
