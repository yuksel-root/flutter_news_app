import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_grid.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  _NewsViewState createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<NewsArticleListViewModel>().state ==
                ArticleState.searching
            ? buildLoadingWidget()
            : context.watch<NewsArticleListViewModel>().state ==
                    ArticleState.error
                ? buildErrorWidget()
                : buildColumnExpandedNewsGrid(context));
  }

  Column buildColumnExpandedNewsGrid(BuildContext context) {
    final listArticles = context.read<NewsArticleListViewModel>().articles;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: NewsGrid(articles: listArticles),
        ),
      ],
    );
  }

  Center buildErrorWidget() => Center(child: Text('Something went wrong!'));
  Center buildLoadingWidget() => Center(
          child: CircularProgressIndicator(
        color: Colors.green,
      ));
}
