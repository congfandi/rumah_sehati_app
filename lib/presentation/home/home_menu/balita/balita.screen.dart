import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/balita.controller.dart';

class BalitaScreen extends GetView<BalitaController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BalitaScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'BalitaScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
