import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/parenting.controller.dart';

class ParentingScreen extends GetView<ParentingController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ParentingScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ParentingScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
