import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ny_times_test/app_strings.dart';
import 'package:ny_times_test/data/model/article.dart';

class ArticleDetailsScreen extends StatelessWidget {
  const ArticleDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Article? article = Get.arguments as Article?;

    if (article == null) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.teal,
          title: const Text(AppStrings.error),
        ),
        body: const Center(
          child: Text(AppStrings.articleNotFound),
        ),
      );
    }

    // Now you can safely use the 'article' object in your screen.
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(AppStrings.detailsTitle),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.title,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w700),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.network(article.imageUrl),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(article.abstract),
            ),
          ],
        ),
      ),
    );
  }
}
