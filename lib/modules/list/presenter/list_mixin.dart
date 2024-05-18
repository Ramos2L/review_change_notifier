import 'dart:async';

import 'package:flutter/material.dart';

import '../controller/list_controller.dart';
import 'list_page.dart';

abstract class ListViewMixin extends State<ListPage> {
  final controller = ListController();

  TextEditingController controllerName = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scheduleMicrotask(() async {
      await controller.loadNames();
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    controller.dispose();
    controllerName.dispose();
  }
}
