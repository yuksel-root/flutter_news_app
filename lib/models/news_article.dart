class NewsArticle {
  final String? title;
  final String? author;
  final String? description;
  final String? urlToImage;
  final String? url;
  final String? publishedAt;
  final String? content;
  final String? source;
  NewsArticle({
    required this.title,
    required this.author,
    required this.description,
    required this.urlToImage,
    required this.url,
    required this.publishedAt,
    required this.content,
    required this.source,
  });

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json['title'] as String?,
        author: json['author'] as String?,
        description: json['description'] as String?,
        urlToImage: json['urlToImage'] as String?,
        url: json['url'] as String?,
        publishedAt: json['publishedAt'] as String?,
        content: json['content'] as String?,
        source: json['source']['name'] as String?);
  }
}
