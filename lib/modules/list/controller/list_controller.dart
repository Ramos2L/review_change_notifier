import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends ChangeNotifier {
  final List<String> _names = [];

  List<String> get names => _names;

  void incrementNames(String name) {
      names.add(name);
      _saveNames();
      notifyListeners();
  }

  void _saveNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('names', names);
  }

  void loadNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    names.addAll(prefs.getStringList('names') ?? []);
  }
}