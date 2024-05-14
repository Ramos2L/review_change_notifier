import 'package:flutter/material.dart';

import '../controller/list_controller.dart';
import 'list_page.dart';

abstract class ListViewMixin extends State<ListPage> {
  final controller = ListController();

  TextEditingController controllerName = TextEditingController();

  List<String> get names => controller.names;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      controllerName.text = '';
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controllerName.dispose();
  }
}
