import 'package:netflix/model/movie_info_model.dart';
import 'package:netflix/service/api_endpoints.dart';
import 'package:netflix/service/base_client.dart';

class HomeBackgroundService {
  String? imageUrl;

  setImage() async {
    dynamic result = await apiCall(ApiendPoint.popularmovies);

    if (result.results.isNotEmpty) {
      MovieinfoModel movieinfo = result.results[2];
      imageUrl =
          'https://image.tmdb.org/t/p/w500${movieinfo.posterpath}?api_key=2f9518d11e1fc9457743e722af86ac50';

      return imageUrl;
    }
  }
}
