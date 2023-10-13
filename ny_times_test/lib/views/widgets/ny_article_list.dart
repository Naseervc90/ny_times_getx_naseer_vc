import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times_test/app_strings.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';

class ArticleList extends StatefulWidget {
  const ArticleList({super.key});

  @override
  State<ArticleList> createState() => _ArticleListState();
}

class _ArticleListState extends State<ArticleList> {
  @override
  Widget build(BuildContext context) {
    final NyTimesController nyTimesController = Get.find();

    return Scaffold(
      body: Obx(() {
        if (nyTimesController.articles.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return ListView.separated(
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: 8.0); // Adjust the height as needed
            },
            itemCount: nyTimesController.articles.length,
            itemBuilder: (context, index) {
              final article = nyTimesController.articles[index];
              return ListTile(
                title: Text(article.title),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(article.abstract),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(flex: 2, child: Text(article.byline)),
                        Flexible(
                            child: Text(
                                article.publishedDate.toLocal().toString())),
                      ],
                    ),
                  ],
                ),
                leading: article.imageUrl != null
                    ? ClipOval(
                  child: Image.network(
                    article.imageUrl,
                    width: 50,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                )
                    : const Icon(Icons.image),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Get.toNamed(AppStrings.articleDetailsNav, arguments: article);
                },
              );
            },
          );
        }
      }),
    );
  }
}
