import 'package:flutter/cupertino.dart';
import 'package:netflix/controller/internetconnectivity_provider.dart';

class HomeScrollprovider extends ChangeNotifier {
  bool isScrolling = true;

  HomeScrollprovider() {
    InternetConnectivityProvider();
  }

  void setIsScrolling(bool value) {
    isScrolling = value;
    notifyListeners();
  }
}
