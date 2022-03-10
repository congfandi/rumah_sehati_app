import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/rekan_bunda.controller.dart';

class RekanBundaScreen extends GetView<RekanBundaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RekanBundaScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'RekanBundaScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
