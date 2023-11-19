import 'package:netflix/constants/string.dart';
import 'package:netflix/service/api_key.dart';

class ApiendPoint {
  static const trendingmovies = "$kBaseUrl/trending/all/day?api_key=$apikey";
  static const searchmovies = "$kBaseUrl/search/movie?api_key=$apikey&query=";
  static const upcomingmovies =
      "$kBaseUrl/movie/upcoming?api_key=$apikey&language=en-US&page=1";
  static const popularmovies =
      "$kBaseUrl/movie/popular?api_key=$apikey&language=en-US&page=1";
  static const populartv =
      "$kBaseUrl/tv/popular?api_key=$apikey&language=en-US&page=1";
  static const topratetv =
      "$kBaseUrl/discover/tv?include_adult=false&language=en-US&page=1&sort_by=vote_average.desc&vote_count.gte=200&api_key=$apikey";

}
