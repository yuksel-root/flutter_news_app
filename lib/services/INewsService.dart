import 'package:flutter_news_app_with_api/core/network/INetworkService.dart';
import 'package:flutter_news_app_with_api/models/news_article.dart';

abstract class INewsService {
  final INetworkManager manager;

  INewsService(this.manager);

  Future<List<NewsArticle>> fetchNewsByCountry(String country);
  Future<List<NewsArticle>> fetchNewsByCategoryWithCountry(
      String country, String category);
}
