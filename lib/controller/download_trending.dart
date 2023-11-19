import 'package:flutter/cupertino.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';
import 'package:netflix/service/download_service.dart';


class TrendingmovieProvider extends ChangeNotifier {
  List imagelist = [];
  bool isLoading = true;

  TrendingmovieProvider() {
    initializeImage();
    InternetConnectivityProvider();
  }
  void initializeImage() async {
    imagelist = await DownloadService().getTrendingMovies();
    isLoading = false;
    notifyListeners();
  }
}
