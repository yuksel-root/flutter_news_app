import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/circle_images.dart';
import 'package:flutter_news_app_with_api/core/constants/categories_constants.dart';
import 'package:flutter_news_app_with_api/core/constants/navigation_constants.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/core/navigation/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_view_model.dart';
import 'package:flutter_news_app_with_api/core/extension/context_extension.dart';

import 'package:provider/provider.dart';

class NewsGrid extends StatelessWidget {
  final NavigationService navigation = NavigationService.instance;
  final List<NewsArticleViewModel> articles;

  NewsGrid({Key? key, required this.articles}) : super(key: key);

  void _showNewsArticleDetails(context, article) => navigation.navigateToPage(
      path: NavigationConstants.NEWS_DETAILS_WIEW, data: article);

  @override
  Widget build(BuildContext context) {
    final tabbarNavProv = Provider.of<TabbarNavigationProvider>(context);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, childAspectRatio: 2, mainAxisSpacing: 5),
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: context.dynamicWidth(0.0277),
                  vertical: context.dynamicHeight(0.001)),
              child: Stack(children: [
                CircleImages(
                  imageUrl: article.imageUrl,
                  imageRadius: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.dynamicWidth(0.0277),
                        vertical: context.dynamicHeight(0.0080),
                      ),
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight,
                                      colors: [
                                        Color(0xffbdc3c7),
                                        Color(0xccbdc3c7)
                                      ],
                                      tileMode: TileMode.clamp)),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: context.dynamicWidth(0.01),
                                    vertical: 0),
                                child: Text(
                                    CategoriesConstants.listCategory[
                                            tabbarNavProv.currentIndex]
                                        ['categoryName'],
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
                                    colors: [
                                      Color(0xff2c3e50),
                                      Color(0xcc2c3e50)
                                    ],
                                    tileMode: TileMode.clamp),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: context.dynamicWidth(0.01),
                                  vertical: context.dynamicHeight(0.0001),
                                ),
                                child: Text(
                                    article.source.contains(".")
                                        ? article.source.split(".").elementAt(0)
                                        : article.source,
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
                    ),
                    Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000080).withOpacity(0.15),
                            blurRadius: 0.01,
                            offset: Offset(0, 0),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: context.dynamicWidth(0.0277),
                            vertical: context.dynamicHeight(0.0253)),
                        child: Text(article.title,
                            style: TextStyle(
                                fontSize: context.dynamicHeight(0.025),
                                fontWeight: FontWeight.w900,
                                letterSpacing: 0.1,
                                color: Colors.white),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
        );
      },
      itemCount: articles.length,
    );
  }
}
