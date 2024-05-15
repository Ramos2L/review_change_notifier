import 'package:flutter/material.dart';

import '../controller/list_controller.dart';
import 'list_page.dart';

abstract class ListViewMixin extends State<ListPage> {
  final controller = ListController();

  TextEditingController controllerName = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    controllerName.dispose();
  }
}
