import 'package:flutter/material.dart';

class ListController extends ChangeNotifier {
  List<String> names = [];

  void incrementNames(String name) {
      names.add(name);
      notifyListeners();
  }

}