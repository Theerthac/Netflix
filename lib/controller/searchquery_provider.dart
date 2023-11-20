import 'package:flutter/cupertino.dart';

class UpdateQueryProvider extends ChangeNotifier {
  String query = '';

  void updateQuery(String newQuery) {
    query = newQuery;
    notifyListeners();
  }
}
