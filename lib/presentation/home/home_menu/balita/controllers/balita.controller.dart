import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/request/article_request.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/views/sakit_bayi_view.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';

import '../../../../../app/data/models/article/response/article.dart';
import '../../../../../app/data/providers/article_provider.dart';
import '../views/kms_digital_view.dart';

class BalitaController extends GetxController implements ApiResponse {
  final TextEditingController genderController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController posyanduDateController = TextEditingController();
  final TextEditingController weightController = TextEditingController();
  final TextEditingController asiController = TextEditingController();
  final TextEditingController searchController = TextEditingController();
  late final ArticleProvider articleProvider = ArticleProvider(this);
  RxList<Article> articles = RxList();
  RxInt currentMenuIndex = 0.obs;
  final List<CalculatorMenu> menus = [
    CalculatorMenu(
        name: Strings.kmsDigital,
        logo: Assets.kmsDigital,
        description: Strings.watchGrowthOfBaby,
        child: const KmsDigitalView()),
    CalculatorMenu(
        name: Strings.sakitPadaBayi,
        logo: Assets.sakitPadaBayi,
        description: Strings.giveLove,
        child: const SakitBayiView()),
  ];

  ArticleRequest query =
      ArticleRequest(page: 1, perPage: 5, category: "sakit-bayi");

  void getArticles() {
    query.query = searchController.text;
    articleProvider.getArticles(query: query);
  }

  void searchArticles() {
    articles.clear();
    query.query = searchController.text;
    articleProvider.getArticles(query: query);
  }

  CalculatorMenu currentMenu() {
    return menus[currentMenuIndex.value];
  }

  void changeMenu(int menu) {
    currentMenuIndex(menu);
  }

  void reset() {
    menus[currentMenuIndex.value].reset();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {}

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    articles.addAll(result?.articles ?? []);
  }
}
