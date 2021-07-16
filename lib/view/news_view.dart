import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
    var logger = Logger();
    //logger.d("init");
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    var listViewModel2 =
        Provider.of<NewsArticleListViewModel>(context).topHeadlines();
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    var articleCount = listViewModel.articles.length.toString();
    logger.d(listViewModel.articles.isEmpty);
    logger.d("article count = " + articleCount);
    return Scaffold(
      appBar: AppBar(),
      body: (Column(
        children: [Text(listViewModel2.toString()), Text(articleCount)],
      )),
    );
  }
}
