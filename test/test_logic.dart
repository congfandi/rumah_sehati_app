import 'package:flutter/cupertino.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/ibu_hamil/controllers/ibu_hamil.controller.dart';

void main(){
  IbuHamilController controller = IbuHamilController();
  controller.firstDate = DateTime.now();
  debugPrint("jalo ${controller.getTrimester1()}");
}