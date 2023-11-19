import 'package:flutter/cupertino.dart';

class updateQueryProvider extends ChangeNotifier {
  String query = '';

  void updateQuery(String newQuery) {
    query = newQuery;
    notifyListeners();
  }
}
