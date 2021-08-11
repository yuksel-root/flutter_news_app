import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_image.dart';
import 'package:flutter_news_app_with_api/core/extension/context_extension.dart';
import 'package:flutter_news_app_with_api/core/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/models/news_categories.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_view_model.dart';
import 'package:provider/provider.dart';
import 'dart:async';
import 'package:flutter_news_app_with_api/core/extension/string_extension.dart';
import 'package:flutter_news_app_with_api/core/language/locale_keys.g.dart';

class NewsDetailsView extends StatelessWidget {
  final NewsArticleViewModel? article;
  final List<NewsCategory>? categories;
  NewsDetailsView({Key? key, this.article, this.categories}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<void>? _launched;
    final tabbarNavProv = Provider.of<TabbarNavigationProvider>(context);
    final newsListViewModel =
        Provider.of<NewsArticleListViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: () => _launched =
                      newsListViewModel.launchInBrowser(article!.url),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0xffbdc3c7).withOpacity(0.75),
                          blurRadius: 2.5,
                          spreadRadius: 5,
                          offset: Offset(0, 0),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.01), vertical: 0),
                      child: Text(LocaleKeys.newsDetails_goArticleButton.locale,
                          style: TextStyle(
                              fontSize: context.dynamicHeight(0.025),
                              fontWeight: FontWeight.w500,
                              letterSpacing: 0.1,
                              color: Colors.white),
                          maxLines: 1,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      )),
      body: ListView(children: [
        SizedBox(
          height: context.dynamicHeight(0.35),
          child: NewsImage(
            imageUrl: this.article!.imageUrl,
            imageRadius: 0,
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: context.dynamicWidth(0.025),
              vertical: context.dynamicHeight(0.025)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(this.article!.title,
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: context.dynamicHeight(0.025),
              ),
              FittedBox(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xffbdc3c7), Color(0xccbdc3c7)],
                            tileMode: TileMode.clamp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.dynamicWidth(0.01),
                            vertical: 0),
                        child: Text(
                            categories!
                                .map((c) => c.categoryName)
                                .elementAt(tabbarNavProv.currentIndex)!
                                .locale,
                            style: TextStyle(
                                fontSize: context.dynamicHeight(0.025),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.1,
                                color: Colors.white),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Color(0xff2c3e50), Color(0xcc2c3e50)],
                            tileMode: TileMode.clamp),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: context.dynamicWidth(0.01),
                          vertical: context.dynamicHeight(0.0001),
                        ),
                        child: Text(
                            article!.source.contains(".")
                                ? article!.source.split(".").elementAt(0)
                                : article!.source,
                            style: TextStyle(
                                fontSize: context.dynamicHeight(0.025),
                                fontWeight: FontWeight.w500,
                                letterSpacing: 0.1,
                                color: Colors.white),
                            maxLines: 1,
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.025),
              ),
              FittedBox(
                child: Row(
                  children: [
                    SizedBox(width: context.dynamicWidth(0.01)),
                    Text(
                      this.article!.publishedAt,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(width: context.dynamicWidth(0.50)),
                    Text(
                      this.article!.author.contains(".")
                          ? article!.author.split(".").elementAt(0)
                          : article!.author,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(width: context.dynamicWidth(0.01)),
                  ],
                ),
              ),
              SizedBox(
                height: context.dynamicHeight(0.025),
              ),
              Text(this.article!.description,
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ),
      ]),
    );
  }
}
