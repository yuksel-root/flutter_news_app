import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/core/network/network_service.dart';
import 'package:flutter_news_app_with_api/models/news_article.dart';

class NewsService {
  static NewsService? _instance;
  static NewsService get instance {
    if (_instance == null) _instance = NewsService._init();
    return _instance!;
  }

  NewsService._init();

  Future<List<NewsArticle>> fetchNewsByCountry(String country) async {
    Iterable list = await NetworkService.instance.dioGet<NewsArticle>(
      ApiConstants.topHeadlines,
      NewsArticle(),
      queryParameters: {"country": country},
    );

    return list.map((article) => NewsArticle().fromJson(article)).toList();
  }

  Future<List<NewsArticle>> fetchNewsByCategoryWithCountry(
      String country, String category) async {
    Iterable list = await NetworkService.instance.dioGet<NewsArticle>(
      ApiConstants.topHeadlines,
      NewsArticle(),
      queryParameters: {"country": country, "category": category},
    );

    return list.map((article) => NewsArticle().fromJson(article)).toList();
  }
}
