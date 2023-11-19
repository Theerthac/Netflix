import 'package:flutter/cupertino.dart';
import 'package:netflix/service/home_background_service.dart';

class HomeBackgroundCardImageProvider with ChangeNotifier {
  String? imageUrl;

  void initialBackgroundCard() async {
    imageUrl = await HomeBackgroundService().setImage();
    notifyListeners();
  }
}
