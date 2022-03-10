import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'controllers/konsultasi_gizi.controller.dart';

class KonsultasiGiziScreen extends GetView<KonsultasiGiziController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('KonsultasiGiziScreen'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'KonsultasiGiziScreen is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
