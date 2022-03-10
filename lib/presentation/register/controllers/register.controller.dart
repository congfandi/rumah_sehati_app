import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  final TextEditingController name = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController retypePassword = TextEditingController();
  final TextEditingController birthDate = TextEditingController();
  final TextEditingController height = TextEditingController();
  final TextEditingController weight = TextEditingController();
  final TextEditingController condition = TextEditingController();

  final List<String> userConditions = [
    "Hamil",
    "Menyusui",
    "Ibu dengan balita"
  ];

  bool _validate() {
    if (name.text.isEmpty) {
      return false;
    }
    return true;
  }
}
