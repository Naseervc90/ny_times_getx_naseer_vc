import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';
import 'package:ny_times_test/views/widgets/ny_article_list.dart';

class NyArticleListScreen extends StatelessWidget {
  final NyArticleController articleController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Article List'),
        leading: Builder(
          builder: (context) {
            return IconButton(
              icon: Icon(Icons.menu), // Replace with your hamburger icon
              onPressed: () {
                // Handle hamburger icon tap (e.g., open drawer)
              },
            );
          },
        ),
        actions: [
          SearchBar(
              // onSearch: (query) {
              //   // Handle search
              //   print('Search for: $query');
              // },
              // articles: articleController.articles, // Pass the articles list
              ),
        ],
      ),
      body: NyArticleListView(),
    );
  }
}
