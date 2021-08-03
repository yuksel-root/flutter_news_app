import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_grid.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xe61c0f45),
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
