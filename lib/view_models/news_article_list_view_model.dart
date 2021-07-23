import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/models/news_article.dart';
import 'package:flutter_news_app_with_api/services/api_service.dart';

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
    //var logger = Logger();
    this.loadingStatus = LoadingStatus.searching;
    // logger.d("topc loadingState = " + loadingStatus.toString());

    List<NewsArticle> newsArticles =
        await ApiService().fetchHeadlinesByCountry(country);

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
      // logger.d("topc" + loadingStatus.toString());
    } else {
      this.loadingStatus = LoadingStatus.completed;
      // logger.d("topc" + loadingStatus.toString());
    }

    notifyListeners();
  }

  void topHeadlines() async {
    //var logger = Logger();
    List<NewsArticle> newsArticles = await ApiService().fetchTopHeadlines();

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
      //  logger.d("top" + loadingStatus.toString());
    } else {
      this.loadingStatus = LoadingStatus.completed;
      // logger.d("top" + loadingStatus.toString());
    }

    notifyListeners();
  }

  void topHeadlinesCategory(String country, String category) async {
    List<NewsArticle> newsArticles =
        await ApiService().fetchTopHeadlinesCategory(country, category);

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    if (this.articles.isEmpty) {
      this.loadingStatus = LoadingStatus.empty;
      //logger.d("top" + loadingStatus.toString());
    } else {
      this.loadingStatus = LoadingStatus.completed;
      // logger.d("top" + loadingStatus.toString());
    }

    notifyListeners();
  }
}
