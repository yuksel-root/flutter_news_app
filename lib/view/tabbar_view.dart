import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

import 'news_article_view.dart';

class NewsTabbarView extends StatefulWidget {
  NewsTabbarView({Key? key}) : super(key: key);

  @override
  _NewsTabbarViewState createState() => _NewsTabbarViewState();
}

class _NewsTabbarViewState extends State<NewsTabbarView>
    with TickerProviderStateMixin {
  late TabController tabController;
  var getCountry;
  @override
  void initState() {
    super.initState();
    getCountry = Provider.of<NewsArticleListViewModel>(context, listen: false)
        .getCountry;
    tabController =
        TabController(length: ApiConstants.Categories.length, vsync: this);
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlinesByCountry(ApiConstants.Countries[getCountry]);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final listViewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: false);
    return DefaultTabController(
      length: ApiConstants.Categories.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            developer.log("tab" + listViewModel.getCountry);
            listViewModel.topHeadlinesCategory(
                ApiConstants.Countries[listViewModel.getCountry],
                ApiConstants.Categories.keys.toList()[tabController.index]);
          }
        });
        return Scaffold(
          appBar: AppBar(
            title: Center(child: Text('News App')),
            bottom: TabBar(
              isScrollable: true,
              tabs: ApiConstants.Categories.keys
                  .map(
                    (e) => Tab(text: e),
                  )
                  .toList(),
            ),
            actions: [
              PopupMenuButton(
                onSelected: (country) async {
                  listViewModel.setCountry = country.toString();
                  listViewModel.topHeadlinesByCountry(ApiConstants.Countries[
                      Provider.of<NewsArticleListViewModel>(context,
                              listen: false)
                          .getCountry]);
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
          body: TabBarView(
            children: List<Widget>.generate(
                ApiConstants.Categories.length, (index) => NewsView()),
          ),
        );
      }),
    );
  }
}
