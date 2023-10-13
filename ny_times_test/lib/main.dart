import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';
import 'package:ny_times_test/views/ny_article_list_screen.dart';
// Import your NyArticleListScreen

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final NyArticleController articleController = Get.put(NyArticleController());

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Article App',
      home: NyArticleListScreen(),
    );
  }
}
