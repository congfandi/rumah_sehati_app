import 'package:get/get.dart';
import 'package:rumah_sehati_mobile/app/data/models/article/request/article_request.dart';
import 'package:rumah_sehati_mobile/app/data/models/base_response.dart';
import '../../../../app/data/models/article/response/article.dart';
import '../../../../app/data/providers/article_provider.dart';
import '../../../../domain/core/interfaces/api_response.dart';

class ArticleController extends GetxController implements ApiResponse {
  RxList<Article> listArticle = RxList();
  late final ArticleProvider _provider = ArticleProvider(this);
  ArticleRequest query = ArticleRequest(perPage: 5, page: 1);
  RxBool isNeedLoading = true.obs;

  void loadMore() {
    query.page = (query.page ?? 0) + 1;
    _provider.getArticles(query: query);
  }

  void search(String value) {
    listArticle.clear();
    isNeedLoading(true);
    query.query = value;
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
