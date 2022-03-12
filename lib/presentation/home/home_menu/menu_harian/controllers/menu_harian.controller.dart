import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/views/bayi_dan_balita_view.dart';
import 'package:rumah_sehati_mobile/presentation/home/home_menu/menu_harian/views/ibu_menyusui_view.dart';

import '../../../../../app/data/models/article/request/article_request.dart';
import '../../../../../app/data/models/article/response/article.dart';
import '../../../../../app/data/models/base_response.dart';
import '../../../../../app/data/providers/article_provider.dart';
import '../../../../../domain/core/interfaces/api_response.dart';
import '../../../../../infrastructure/utils/resources/resources.dart';
import '../../calculator/controllers/calculator.controller.dart';
import '../views/ibu_hamil_view.dart';

class MenuHarianController extends GetxController implements ApiResponse {
  RxInt currentMenuIndex = 0.obs;
  final List<CalculatorMenu> menus = [
    CalculatorMenu(
        name: Strings.babyAndBalita,
        logo: Assets.babyAndBalita,
        description: Strings.fillOfplate,
        child: const BayiDanBalitaView()),
    CalculatorMenu(
      name: Strings.momPregnan,
      logo: Assets.ibuHamil,
      description: Strings.fillOfplate,
      child: const IbuHamilView(),
    ),
    CalculatorMenu(
        name: Strings.momFeed,
        logo: Assets.ibuMenyusui,
        description: Strings.fillOfplate,
        child: const IbuMenyusuiView()),
  ];

  CalculatorMenu currentMenu() {
    return menus[currentMenuIndex.value];
  }

  void changeMenu(int menu) {
    currentMenuIndex(menu);
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
