import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ListController extends ChangeNotifier {
  final List<String> _names = [];

  List<String> get names => _names;

  void incrementNames(String name) async {
      names.add(name);
      await _saveNames();
      notifyListeners();
  }

  Future<void> _saveNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('names', names);
  }

  Future<void> loadNames() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    names.addAll(prefs.getStringList('names') ?? []);
  }
}