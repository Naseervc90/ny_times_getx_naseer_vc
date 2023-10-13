import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';
import 'package:ny_times_test/views/ny_article_list_screen.dart';

void main() {
  // Initialize the GetX environment
  setUpAll(() {
    Get.testMode = true;
  });

  testWidgets('NyArticleListScreen UI Test', (WidgetTester tester) async {
    // Create a test ArticleController with some sample articles
    final testController = NyArticleController();
    testController.articles.assignAll([
      Article(
        title: 'Article 1',
        detail1: 'Detail 1 of Article 1',
        detail2: 'Detail 2 of Article 1',
        detail3: 'Detail 3 of Article 1',
        username: 'User1',
        date: '2023-10-13',
      ),
      // Add more sample articles here
    ]);

    // Build the NyArticleListScreen widget
    await tester.pumpWidget(
      GetMaterialApp(
        home: NyArticleListScreen(),
        initialBinding: BindingsBuilder(() {
          Get.put<NyArticleController>(testController);
        }),
      ),
    );

    // Verify that the NyArticleListScreen is displayed
    expect(find.text('Article List'), findsOneWidget);

    // You can add more test assertions here to verify the UI elements as needed
  });
}
