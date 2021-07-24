import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:logger/logger.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as developer;

class Tabbar extends StatefulWidget {
  final Widget child;

  Tabbar({Key? key, required this.child}) : super(key: key);

  @override
  _TabbarState createState() => _TabbarState();
}

class _TabbarState extends State<Tabbar> with TickerProviderStateMixin {
  late TabController tabController;
  var logger = Logger();

  @override
  void initState() {
    super.initState();
    tabController =
        TabController(length: ApiConstants.Categories.length, vsync: this);
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .topHeadlines();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsArticleListViewModel>(context);
    return DefaultTabController(
      length: ApiConstants.Categories.length,
      child: Builder(builder: (BuildContext context) {
        final TabController tabController = DefaultTabController.of(context)!;
        tabController.addListener(() {
          if (!tabController.indexIsChanging) {
            listViewModel.topHeadlinesCategory("tr",
                ApiConstants.Categories.keys.toList()[tabController.index]);
            //developer.log("length" + listViewModel.articles.length.toString());
          }
        });
        return Scaffold(
          appBar: AppBar(
            actions: [
              Expanded(
                child: TabBar(
                  isScrollable: true,
                  tabs: ApiConstants.Categories.keys
                      .map(
                        (e) => Tab(text: e),
                      )
                      .toList(),
                ),
              )
            ],
          ),
          body: TabBarView(
            controller: tabController,
            children: List<Widget>.generate(
                ApiConstants.Categories.length, (index) => widget.child),
          ),
        );
      }),
    );
  }
}
