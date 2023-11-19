import 'package:flutter/cupertino.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/newandhot_service.dart';

class NewAndHotProvider extends ChangeNotifier {
  List<MovieinfoModel> upcomingMovies = [];

  List<MovieinfoModel> moviepopular = [];
  bool isLoading = true;

  Future fetchComingSoonMovies() async {
    upcomingMovies = await NewandHotService().fetchUpcomingMovies();
    notifyListeners();
  }

  Future fetchEveryoneWatchingMovies() async {
    moviepopular = await NewandHotService().fetchMoviesPopular();
    isLoading = false;
    notifyListeners();
  }
}
