import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_grid.dart';
import 'package:flutter_news_app_with_api/view/tabbar_view.dart';
import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/core/preferences/shared_manager.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  bool isCached = false;
  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    //developer.log('article_length' + listViewModel.articles.length.toString());
    /*  listViewModel.articles.forEach((element) {
      developer.log(element.title);
    }); */
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: NewsGrid(articles: listViewModel.articles),
          ),
        ],
      ),
    );
  }
}
