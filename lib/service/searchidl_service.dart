import 'dart:developer';

import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/api_endpoints.dart';
import 'package:netflix/service/base_client.dart';

class SearchIDLService {
  List<MovieinfoModel> trendingMovies = [];

  Future fetchSearchMovies() async {
    try {
      final movies = await apiCall(ApiendPoint.trendingmovies);
      trendingMovies = movies.results;
    } catch (error) {
      log("Error fetching trending movies: $error");
    }
    return trendingMovies;
  }
}
