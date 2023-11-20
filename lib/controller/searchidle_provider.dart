import 'package:flutter/widgets.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/searchidl_service.dart';

class SearchIDLProvider extends ChangeNotifier {
  List<MovieinfoModel> trendingMovies = [];
  bool isLoading = true;

  Future fetchSearchIDLMovies() async {
    trendingMovies = await SearchIDLService().fetchSearchMovies();
    isLoading = false;
    notifyListeners();
  }
}
