import 'package:flutter/material.dart';
import 'package:ny_times_test/controller/ny_article_controller.dart';

class NyArticleListItem extends StatelessWidget {
  final Article article;

  NyArticleListItem({required this.article});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.all(16),
      leading: CircleAvatar(
        backgroundImage: NetworkImage('URL_TO_CIRCULAR_IMAGE'),
      ),
      title: Text(article.title, style: TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(article.detail1),
          Text(article.detail2),
          Text(article.detail3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(article.username, style: TextStyle(fontSize: 12)),
              Text(' | ', style: TextStyle(fontSize: 12)),
              Text(article.date, style: TextStyle(fontSize: 12)),
            ],
          )
        ],
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
    );
  }
}
