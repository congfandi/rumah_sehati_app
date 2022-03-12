import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/questioner.controller.dart';

class QuestionerScreen extends GetView<QuestionerController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QuestionerScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'QuestionerScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
