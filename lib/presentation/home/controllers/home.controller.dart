import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/screens.dart';
const int homeMenu = 0;
const int faskes = 1;
const int dataAnak = 2;
const int profile = 3;

class HomeController extends GetxController {
  final RxList<Widget> pages = RxList<Widget>([
    const HomeMenuScreen(),
    const FaskesScreen(),
    const ChildrenScreen(),
    const ProfileScreen()
  ]);
  RxInt currentIndex = 0.obs;

  Rx<Widget> currentPage() => Rx(pages[currentIndex.value]);

  void changePage(int page) {
    currentIndex(page);
  }
}
