class Article {
  String title;
  String byline;
  String abstract;
  String imageUrl;
  DateTime publishedDate;

  Article({
    required this.title,
    required this.byline,
    required this.abstract,
    required this.imageUrl,
    required this.publishedDate,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      title: json['title'] ?? '',
      byline: json['byline'] ?? '',
      abstract: json['abstract'] ?? '',
      imageUrl: json['media'][0]['media-metadata'][1]['url'] ?? '',
      publishedDate: DateTime.parse(json['published_date'] ?? ''),
    );
  }
}
