import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_grid.dart';
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
    //logger.d("init consumer == provider.of");
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    var logger = Logger();
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);

    /*  listViewModel.articles.forEach((element) {
      // return Text(listViewModel.articles[index].title);
      //  child:Image.network(listViewModel.articles[index].imageUrl)
      logger.d(element.title);
    }); */
    return Scaffold(
      appBar: AppBar(),
      body: NewsGrid(
        articles: listViewModel.articles,
      ),
    );
  }
}
