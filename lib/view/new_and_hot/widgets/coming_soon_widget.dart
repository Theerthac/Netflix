import 'package:flutter/material.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/controller/newandhot_provider.dart';
import 'package:netflix/view/new_and_hot/widgets/coming_soon_indo_card.dart';
import 'package:provider/provider.dart';

class ComingSoonWidget extends StatefulWidget {
  const ComingSoonWidget({
    super.key,
  });

  @override
  State<ComingSoonWidget> createState() => _ComingSoonWidgetState();
}

class _ComingSoonWidgetState extends State<ComingSoonWidget> {
  @override
  void initState() {
    super.initState();
    Provider.of<NewAndHotProvider>(context, listen: false)
        .fetchComingSoonMovies();
    Provider.of<InternetConnectivityProvider>(context, listen: false)
        .getInternetConnectivity(context);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewAndHotProvider>(
        builder: (context, comingSoonprovider, child) {
      if (comingSoonprovider.isLoading) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (comingSoonprovider.upcomingMovies.isEmpty) {
        return const Text("No data available");
      }
      return ListView.builder(
          itemCount: comingSoonprovider.upcomingMovies.length,
          itemBuilder: (context, index) => ComingSoonInfoCard(
              movieinfo: comingSoonprovider.upcomingMovies[index]));
    });
  }
}
