import 'dart:developer';

import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/api_endpoints.dart';
import 'package:netflix/service/base_client.dart';

class NewandHotService {
  List<MovieinfoModel> upcomingmovies = [];
  List<MovieinfoModel> popularmovies = [];

  Future fetchUpcomingMovies() async {
    try {
      final movies = await apiCall(ApiendPoint.upcomingmovies);
      upcomingmovies = movies.results;
    } catch (error) {
      log("Error fetching trending movies :$error");
    }
    return upcomingmovies;
  }

  Future fetchMoviesPopular() async {
    try {
      final movies = await apiCall(ApiendPoint.popularmovies);
      popularmovies = movies.results;
    } catch (error) {
      ;
    log("Error fetching trending movies: $error");
    }
    return popularmovies;
  }
}
