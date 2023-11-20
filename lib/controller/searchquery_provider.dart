import 'package:flutter/widgets.dart';

class SearchQueryProvider extends ChangeNotifier {
  String query ='';

  void updateQuery(String newQuery) {
    query = newQuery;
    notifyListeners();
  }
}
