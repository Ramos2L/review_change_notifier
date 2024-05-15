import 'package:flutter/material.dart';

class ListController extends ChangeNotifier {
  final List<String> _names = [];

  List<String> get names => _names;

  void incrementNames(String name) {
      names.add(name);
      notifyListeners();
  }
}