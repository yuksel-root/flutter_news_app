import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_grid.dart';
import 'package:flutter_news_app_with_api/components/tabbar.dart';
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
      appBar: AppBar(
        title: Center(child: Text('News App')),
        actions: [
          PopupMenuButton(
            onSelected: (country) async {
              final isSavedCountry = await SharedManager.instance
                  .saveStringValue('Country', country.toString());
              if (isSavedCountry) {
                final getCountry =
                    SharedManager.instance.getStringValue('Country');
                developer.log(getCountry.toString());
                listViewModel
                    .topHeadlinesByCountry(ApiConstants.Countries[getCountry]);
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) {
              return ApiConstants.Countries.keys
                  .map((v) => PopupMenuItem(
                        value: v,
                        child: Text(v),
                      ))
                  .toList();
            },
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: Tabbar(
            child: NewsGrid(articles: listViewModel.articles),
          )),
        ],
      ),
    );
  }
}
