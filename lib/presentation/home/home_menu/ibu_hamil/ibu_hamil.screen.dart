import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/ibu_hamil.controller.dart';

class IbuHamilScreen extends GetView<IbuHamilController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IbuHamilScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'IbuHamilScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
