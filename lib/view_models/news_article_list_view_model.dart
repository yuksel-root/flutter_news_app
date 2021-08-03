import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/preferences/shared_manager.dart';
import 'package:flutter_news_app_with_api/models/news_article.dart';
import 'package:flutter_news_app_with_api/services/api_service.dart';
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
  late ArticleState _state;
  late List<NewsArticleViewModel> articles;
  late List<NewsArticle> newsArticles;
  PrefsState _currentPrefs = PrefsState(
    country: "Korea",
  );

  NewsArticleListViewModel() {
    articles = [];
    newsArticles = [];
    _state = ArticleState.empty;

    _loadCountryPref();
  }

  ArticleState get state => _state;
  set state(ArticleState state) {
    _state = state;
  }

  Future<void> _loadCountryPref() async {
    final country = SharedManager.instance.getStringValue('Country');

    if (country == "Null") return;

    _currentPrefs = PrefsState(country: country);
    notifyListeners();
  }

  Future<void> launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _saveCountryPref() async {
    await SharedManager.instance
        .saveStringValue('Country', _currentPrefs.country);
  }

  String get getCountry {
    developer.log("getView" + _currentPrefs.country);
    return _currentPrefs.country;
  }

  set setCountry(String newValue) {
    if (newValue == _currentPrefs.country) return;
    _currentPrefs = PrefsState(
      country: newValue,
    );
    notifyListeners();
    _saveCountryPref();
  }

  void topHeadlinesByCountry(String country) async {
    try {
      state = ArticleState.searching;
      newsArticles = await ApiService().fetchHeadlinesByCountry(country);
      state = ArticleState.completed;

      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();
    } catch (e) {
      developer.log(e.toString());
      state = ArticleState.error;
    }

    notifyListeners();
  }

  void topHeadlines() async {
    try {
      state = ArticleState.searching;
      newsArticles = await ApiService().fetchTopHeadlines();
      state = ArticleState.completed;

      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();
    } catch (e) {
      developer.log(e.toString());
      state = ArticleState.error;
    }

    notifyListeners();
  }

  void topHeadlinesCategory(String country, String category) async {
    try {
      state = ArticleState.searching;
      newsArticles =
          await ApiService().fetchTopHeadlinesCategory(country, category);
      state = ArticleState.completed;

      this.articles = newsArticles
          .map((article) => NewsArticleViewModel(article: article))
          .toList();
    } catch (e) {
      developer.log(e.toString());
      state = ArticleState.error;
    }

    notifyListeners();
  }
}

class PrefsState {
  final String country;

  const PrefsState({
    required this.country,
  });
}
