import 'package:get/get.dart';

class NyArticleController extends GetxController {
  RxList<Article> articles = <Article>[].obs;

  @override
  void onInit() {
    fetchArticles();
    super.onInit();
  }

  void fetchArticles() {
    // Simulate fetching data from an API or database
    articles.assignAll([
      Article(
        title: 'Article 1',
        detail1: 'Detail 1 of Article 1',
        detail2: 'Detail 2 of Article 1',
        detail3: 'Detail 3 of Article 1',
        username: 'User1',
        date: '2023-10-13',
      ),
      Article(
        title: 'Article 2',
        detail1: 'Detail 1 of Article 2',
        detail2: 'Detail 2 of Article 2',
        detail3: 'Detail 3 of Article 2',
        username: 'User2',
        date: '2023-10-14',
      ),
      // Add more articles here
    ]);
  }
}

class Article {
  final String title;
  final String detail1;
  final String detail2;
  final String detail3;
  final String username;
  final String date;

  Article({
    required this.title,
    required this.detail1,
    required this.detail2,
    required this.detail3,
    required this.username,
    required this.date,
  });
}
