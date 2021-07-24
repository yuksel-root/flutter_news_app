import 'package:dio/dio.dart';
import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/models/news_article.dart';
import 'dart:developer' as developer;

class ApiService {
  late Dio _dio; //= new Dio();

  ApiService() {
    _dio = Dio();
  }

  Future<List<NewsArticle>> fetchHeadlinesByCountry(String country) async {
    final response = await _dio.get(ApiConstants.headlinesFor(country));

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      //var logger = Logger();
      /* developer.log(list
          .map((article) => NewsArticle.fromJson(article).author)
          .toString());

      list.forEach((element) {
         developer.log(element.toString());
      }); */
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news with country");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await _dio.get(ApiConstants.defaultTopHeadlinesUrl);

    if (response.statusCode == 200) {
      final result = response.data;
      Iterable list = result['articles'];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news with default country");
    }
  }

  Future<List<NewsArticle>> fetchTopHeadlinesCategory(
      String country, String category) async {
    final response =
        await _dio.get(ApiConstants.topHeadlinesForCategory(country, category));

    if (response.statusCode == 200) {
      final result = response.data;
      //developer.log("response" + result.toString());
      Iterable list = result['articles'];
      developer.log("articles" + list.length.toString());
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception("Failed to get top news with category by country");
    }
  }
}
