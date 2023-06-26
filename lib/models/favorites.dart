import 'package:flutter/cupertino.dart';

class Favorites extends ChangeNotifier {
  final List<int> _favoriteItems = [];


  List<int> get favoriteItems => _favoriteItems;

  void add(int itemNo) {
    _favoriteItems.add(itemNo);
    notifyListeners();
  }

  void remove(int itemNo) {
    _favoriteItems.remove(itemNo);
    notifyListeners();
  }
}
