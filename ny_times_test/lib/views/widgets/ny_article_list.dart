import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';
import 'package:ny_times_test/views/widgets/ny_article_list_item.dart';

class NyArticleListView extends StatelessWidget {
  final NyArticleController articleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return ListView.builder(
        itemCount: articleController.articles.length,
        itemBuilder: (context, index) {
          final article = articleController.articles[index];
          return NyArticleListItem(article: article);
        },
      );
    });
  }
}
