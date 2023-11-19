import 'package:flutter/cupertino.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/tvoperate_service.dart';

class TvTopRateProvider extends ChangeNotifier {
  List<MovieinfoModel> tvtopRate = [];
  bool isLoading = true;

  TvTopRateProvider() {
    fetchTvTopeRateMovies();
  }

  Future fetchTvTopeRateMovies() async {
    tvtopRate = await TvTopeRateService().fetchTvTopeRateMovies();
    isLoading = false;
    notifyListeners();
  }
}
