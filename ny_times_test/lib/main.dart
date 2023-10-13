import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';
import 'package:ny_times_test/views/ny_article_details_screen.dart';
import 'package:ny_times_test/views/ny_article_list_screen.dart';


import 'package:ny_times_test/app_strings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NyTimesController());
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => const ArticleListScreen(),
        ),
        GetPage(
          name: AppStrings.articleDetailsNav,
          page: () => const ArticleDetailsScreen(),
        ),
      ],
    );
  }
}


