import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/menu.harian/menu_harian_request.dart';
import 'package:rumah_sehati_mobile/app/data/models/menu.harian/menu_harian_response.dart';
import 'package:rumah_sehati_mobile/app/data/providers/menu.harian.provider.dart';
import '../../../../../app/data/models/base_response.dart';
import '../../../../../domain/core/interfaces/api_response.dart';

class MenuHarianController extends GetxController implements ApiResponse {
  RxList<MenuHarian> menuHarian = RxList();
  RxList<MenuHarian> makanSiang = RxList();
  RxList<MenuHarian> makanMalam = RxList();
  RxList<MenuHarian> sarapan = RxList();
  RxList<MenuHarian> snack = RxList();
  late final MenuHarianProvider _provider = MenuHarianProvider(this);
  MenuHarianRequest query =
      MenuHarianRequest(perpage: 5, page: 1, category: 'Bayi dan Balita');
  RxBool isNeedLoading = true.obs;
  final List<String> jenisMakanan = [
    "Makan Malam",
    "Sarapan",
    "Makan Siang",
    "Snack"
  ];

  RxString selectedJenisMakanan = RxString("Makan Malam");

  changeJenisMakanan(String jenisMakanan) {
    selectedJenisMakanan.value = jenisMakanan;
    setList();
  }

  void loadMore() {
    query.page = (query.page ?? 0) + 1;
    _provider.getMenuHarian(query);
  }

  void filter(MenuHarianRequest query) {
    menuHarian.clear();
    sarapan.clear();
    makanMalam.clear();
    makanSiang.clear();
    snack.clear();
    isNeedLoading(true);
    _provider.getMenuHarian(query);
  }

  void setList() {
    switch (selectedJenisMakanan.value) {
      case "Makan Malam":
        menuHarian.clear();
        menuHarian.addAll(makanMalam);
        break;
      case "Sarapan":
        menuHarian.clear();
        menuHarian.addAll(sarapan);
        break;
      case "Makan Siang":
        menuHarian.clear();
        menuHarian.addAll(makanSiang);
        break;
      case "Snack":
        menuHarian.clear();
        menuHarian.addAll(snack);
        break;
    }
    debugPrint(
        "menu ${menuHarian.length} malam ${makanMalam.length} sarapan ${sarapan.length} siang ${makanSiang.length} snack ${snack.length}");
  }

  @override
  void onReady() {
    _provider.getMenuHarian(query);
    isNeedLoading(true);
    super.onReady();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {
    isNeedLoading(false);
  }

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    sarapan.addAll(result?.sarapan ?? []);
    makanMalam.addAll(result?.makanMalam ?? []);
    makanSiang.addAll(result?.makanSiang ?? []);
    snack.addAll(result?.snack ?? []);
    setList();
  }
}
