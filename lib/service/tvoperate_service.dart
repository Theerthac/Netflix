import 'dart:developer';

import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/api_endpoints.dart';
import 'package:netflix/service/base_client.dart';

class TvTopeRateService {
  List<MovieinfoModel> topratetv = [];
  Future fetchTvTopeRateMovies() async {
    try {
      final movies = await apiCall(ApiendPoint.topratetv);
      topratetv = movies.results;
    } catch (error) {
      log('Error fetching trending movies: $error');
    }
    return topratetv;
    
  }
}
