import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/request/article_request.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/models/kms/kms.dart';
import 'package:rumah_sehati_mobile/app/data/providers/kms.provider.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/extension/string_extension.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/balita/views/kms.digital.result.dart';
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
  late final KmsProvider kmsProvider = KmsProvider(this);
  RxBool isLoading = true.obs;
  RxList<Article> articles = RxList();
  RxInt currentMenuIndex = 0.obs;
  final List<CalculatorMenu> menus = [
    CalculatorMenu(
        name: Strings.kmsDigital,
        logo: Assets.kmsDigital,
        description: "Kartu Menuju Sehat Digital",
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
    isLoading(true);
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

  resultOflKms() {
    KmsDigitalResult(
      asiController: asiController,
      dateOfBirthController: dateOfBirthController,
      genderController: genderController,
      posyanduDateController: posyanduDateController,
      weightController: weightController,
    );
    kmsProvider.saveKms(
      Kms(
        weight: double.parse(weightController.text),
        asi: asiController.text,
        birthDate: dateOfBirthController.text,
        posyanduDate: posyanduDateController.text,
        createdAt: DateTime.now().toString(),
        gender: genderController.text,
        usia: dateOfBirthController.text.ageInMonth(format: 'dd MMMM yyyy'),
      ),
    );
  }

  void reset() {
    genderController.clear();
    dateOfBirthController.clear();
    posyanduDateController.clear();
    weightController.clear();
    asiController.clear();
    searchController.clear();
    menus[currentMenuIndex.value].reset();
  }

  @override
  void onFailedRequest(String path, int statusCode, String message) {}

  @override
  void onFinishRequest(String path) {
    isLoading(false);
  }

  @override
  void onStartRequest(String path) {}

  @override
  void onSuccessRequest(String path, ResultResponse? result, String method) {
    articles.addAll(result?.articles ?? []);
  }
}
