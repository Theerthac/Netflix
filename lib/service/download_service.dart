import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/model/tmdb_api_response.dart';
import 'package:netflix/service/api_endpoints.dart';
import 'package:netflix/service/api_key.dart';

class DownloadService {
  Future<List<String>> getTrendingMovies() async {
    try {
      List<String> imageList = [];
      final response = await http.get(Uri.parse(ApiendPoint.trendingmovies));
      if (response.statusCode == 200) {
        Map<String, dynamic> data =
            jsonDecode(response.body) as Map<String, dynamic>;
        TMDBApiResponseModel tmdbApiResponse =
            TMDBApiResponseModel.fromjson(data);

        for (MovieinfoModel movieinfo in tmdbApiResponse.results) {
          if (movieinfo.posterpath != null) {
            imageList.add(
                'https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=2f9518d11e1fc9457743e722af86ac50');
          }
        }
        return imageList;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
