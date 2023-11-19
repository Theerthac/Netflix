import 'package:flutter/cupertino.dart';
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/searchresult_service.dart';

class SearchResultProvider extends ChangeNotifier {
  List<MovieinfoModel> searchResultMovies = [];

  Future fetchSearchResult(BuildContext context, String apiQuery) async {
    searchResultMovies =
        await SearchResultService().fetchSearchResultMovies(context, apiQuery);
    notifyListeners();
  }
}
