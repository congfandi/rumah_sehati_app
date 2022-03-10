import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/calculator.controller.dart';

class CalculatorScreen extends GetView<CalculatorController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CalculatorScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'CalculatorScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
