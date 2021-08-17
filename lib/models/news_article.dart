import 'package:flutter_news_app_with_api/core/models/base_model.dart';

class NewsArticle extends BaseModel {
  final String? title;
  final String? author;
  final String? description;
  final String? urlToImage;
  final String? url;
  final String? publishedAt;
  final String? content;
  final String? source;

  NewsArticle({
    this.title,
    this.author,
    this.description,
    this.urlToImage,
    this.url,
    this.publishedAt,
    this.content,
    this.source,
  });

  @override
  NewsArticle fromJson(Map<String, dynamic> json) {
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
