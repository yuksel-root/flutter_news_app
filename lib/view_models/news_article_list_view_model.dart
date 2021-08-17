import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/models/news_article.dart';
import 'package:flutter_news_app_with_api/services/news_service.dart';
import 'dart:developer' as developer;
import 'news_article_view_model.dart';
import 'package:url_launcher/url_launcher.dart';

enum ArticleState {
  completed,
  searching,
  empty,
  error,
}

class NewsArticleListViewModel with ChangeNotifier {
  late ArticleState? _state;
  late List<NewsArticleViewModel> articles;
  late List<NewsArticle> newsArticles;
  final NewsService newsService = NewsService.instance;

  NewsArticleListViewModel() {
    articles = [];
    newsArticles = [];
    _state = ArticleState.empty;
  }

  ArticleState get state => _state!;
  set state(ArticleState state) {
    _state = state;
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> topHeadlinesByCountry(String country) async {
    try {
      state = ArticleState.searching;
      newsArticles = await newsService.fetchNewsByCountry(country);
      state = ArticleState.completed;
    } catch (e) {
      developer.log("topHeadlinesByCountry " + e.toString());
      state = ArticleState.error;
    }

    this.articles = newsArticles
        .map((article) => NewsArticleViewModel(article: article))
        .toList();

    notifyListeners();
  }

  Future<void> topHeadlinesCategoryWithCountry(
      String country, String? category) async {
    try {
      state = ArticleState.searching;
      newsArticles =
          await newsService.fetchNewsByCategoryWithCountry(country, category!);
      state = ArticleState.completed;

      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();
    } catch (e) {
      developer.log("topHeadlinesCategoryWithCountry" + e.toString());
      state = ArticleState.error;
    }

    notifyListeners();
  }
}
