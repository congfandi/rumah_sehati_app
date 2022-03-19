import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/request/article_request.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/response/article.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import 'package:rumah_sehati_mobile/app/data/providers/providers.dart';
import 'package:rumah_sehati_mobile/domain/core/interfaces/api_response.dart';
import 'package:rumah_sehati_mobile/infrastructure/utils/resources/resources.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/calculator/controllers/calculator.controller.dart';


class ParentingController extends GetxController implements ApiResponse {
  RxInt currentMenuIndex = 0.obs;
  final List<CalculatorMenu> menus = [
    CalculatorMenu(
        name: Strings.umum,
        logo: Assets.parentingUmum,
        description: Strings.articleAndParentingUmum,
        child: const SizedBox(),),
    CalculatorMenu(
      name: "0 - 12 Bulan",
      logo: Assets.parenting0,
      description: Strings.articleAndParenting0,
      child: const SizedBox(),
    ),
    CalculatorMenu(
        name: "1 - 3 Tahun",
        logo: Assets.parenting1,
        description: Strings.articleAndParenting1,
        child: const SizedBox(),),
    CalculatorMenu(
      name: Strings.menyusui,
      logo: Assets.parentingMenyusui,
      description: Strings.articleAndParentingMenyusui,
      child: const SizedBox(),),
  ];

  CalculatorMenu currentMenu() {
    return menus[currentMenuIndex.value];
  }

  void changeMenu(int menu) {
    currentMenuIndex(menu);
    filter(menus[menu].name);
  }

  void reset() {
    menus[currentMenuIndex.value].reset();
  }

  RxList<Article> listArticle = RxList();
  late final ArticleProvider _provider = ArticleProvider(this);
  ArticleRequest query = ArticleRequest(perPage: 5, page: 1);
  RxBool isNeedLoading = true.obs;

  void loadMore() {
    query.page = (query.page ?? 0) + 1;
    _provider.getArticles(query: query);
  }

  void filter(String value) {
    listArticle.clear();
    isNeedLoading(true);
    query.category = value;
    _provider.getArticles(query: query);
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
    listArticle.addAll(result?.articles ?? []);
  }
}
