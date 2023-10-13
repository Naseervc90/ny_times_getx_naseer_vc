import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times_test/app_strings.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';
import 'package:ny_times_test/views/widgets/ny_article_list.dart';


class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  final String _searchQuery = '';
  @override
  Widget build(BuildContext context) {
    final NyTimesController nyTimesController = Get.find();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text(AppStrings.appTitle),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 24.0),
            child: IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {
                log('Search query: $_searchQuery');
              },
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (nyTimesController.articles.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const ArticleList();
        }
      }),
    );
  }
}