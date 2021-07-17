class NewsArticle {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  NewsArticle(
      {required this.title,
      required this.author,
      required this.description,
      required this.urlToImage,
      required this.url,
      required this.publishedAt,
      required this.content});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'] ?? "undefined title",
        author: json['author'] ?? "undfined author",
        description: json['description'] ?? "undefined desc",
        urlToImage: json['urlToImage'] ?? "undefined img",
        url: json['url'] ?? "undefined url",
        publishedAt: json['publishedAt'] ?? "undefined publish",
        content: json['content'] ?? "undefined content");
  }
}
