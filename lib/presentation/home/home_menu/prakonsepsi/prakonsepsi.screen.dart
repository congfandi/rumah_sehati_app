import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/prakonsepsi.controller.dart';

class PrakonsepsiScreen extends GetView<PrakonsepsiController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PrakonsepsiScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'PrakonsepsiScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
