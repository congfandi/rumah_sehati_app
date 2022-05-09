import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';

import '../welcome_header.dart';

class LoginRegisterController extends GetxController {
  final PageController pageController = PageController();
  final headers = [
    WelcomeHeader(
        image: Assets.auth1,
        title: "Terpercaya",
        description:
            "Semua Data Bunda akan terjamin privasinya dan tidak disebarluaskan"),
    WelcomeHeader(
        image: Assets.auth2,
        title: "Antisipasi Resiko",
        description:
            "Antisipasi Resiko KEK, Balita Gizi Buruk, dan Stunting dengan pemenuhan gizi seimbang"),
    WelcomeHeader(
        image: Assets.auth3,
        title: "Belajar Bersama",
        description:
            "Berkonsultasi online dengan para ahli dan rekan Bunda melalui pesan atau group whatsapp"),
    WelcomeHeader(
        image: Assets.auth4,
        title: "Edukasi",
        description:
            "Yuk! Baca artikel, tips, dan video edukasi untuk menjawab kebingungan bunda"),
  ];

  RxInt currentIndex = RxInt(0);

  changePage(int page) {
    currentIndex(page);
  }

  Timer? timer;

  @override
  void onReady() {
    int page = 0;
    timer = Timer.periodic(const Duration(seconds: 3), (timer) {
      if (page < headers.length - 1) {
        page++;
      } else {
        page = 0;
      }
      pageController.animateToPage(page,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut);
      super.onReady();
    });
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}
