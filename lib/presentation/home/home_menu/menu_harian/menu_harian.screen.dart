import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/menu_harian.controller.dart';

class MenuHarianScreen extends GetView<MenuHarianController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MenuHarianScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'MenuHarianScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
