import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/models/news_article.dart';
import 'package:flutter_news_app_with_api/services/api_service.dart';
import 'package:logger/logger.dart';

import 'news_article_view_model.dart';

enum LoadingStatus {
  completed,
  searching,
  empty,
}

class NewsArticleListViewModel with ChangeNotifier {
  LoadingStatus loadingStatus = LoadingStatus.searching;
  List<NewsArticleViewModel> articles = <NewsArticleViewModel>[];

  void topHeadlinesByCountry(String country) async {
    var logger = Logger();
    this.loadingStatus = LoadingStatus.searching;
    logger.d("loadingStateus = " + loadingStatus.toString());
    notifyListeners();

    List<NewsArticle> newsArticles =
        await ApiService().fetchHeadlinesByCountry(country);

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
  }

  Future topHeadlines() async {
    var logger = Logger();
    List<NewsArticle> newsArticles = await ApiService().fetchTopHeadlines();
    logger.d("topHeadlines");
    notifyListeners();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
    } else {
      this.loadingStatus = LoadingStatus.completed;
    }

    notifyListeners();
    return newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();
    ;
  }
}
