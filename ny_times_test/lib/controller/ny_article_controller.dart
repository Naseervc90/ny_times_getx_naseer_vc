import 'package:get/get.dart';

import 'package:ny_times_test/app_config.dart';
import 'package:ny_times_test/data/model/article.dart';
import 'package:ny_times_test/data/repositories/article_repository.dart';

class NyTimesController extends GetxController {
  final ArticleRepository _articleRepository =
  ArticleRepository(apiKey: nyTimesApiKey, apiEndpoint: nyTimesApiEndpoint);

  final RxList articles = <Article>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchMostViewedArticles();
  }

  List getArticles() {
    return articles.toList();
  }

  void fetchMostViewedArticles() async {
    final List<Article> articleData =
    await _articleRepository.getMostViewedArticles();

    if (articleData.isNotEmpty) {
      articles.assignAll(articleData);
    }
  }
}
