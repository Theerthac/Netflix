import 'package:netflix/model/movie_info_model.dart';

class TMDBApiResponseModel {
  List<MovieinfoModel> results = [];

  TMDBApiResponseModel.fromjson(Map data) {
    results = (data['results'] as List)
        .map((item) => MovieinfoModel.fromjson(item))
        .where((movieinfo) => movieinfo != null)
        .toList();
  }

  Map<String, dynamic> tojson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['results'] =
        results.map((MovieinfoModel movieinfo) => movieinfo.tojson()).toList();

    return data;
  }
}
