import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/circle_images.dart';
import 'package:flutter_news_app_with_api/core/constants/navigation_constants.dart';
import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_view_model.dart';

//TODO add article.category
//TODO add dynamic padding size

class NewsGrid extends StatelessWidget {
  final NavigationService navigation = NavigationService.instance;
  final List<NewsArticleViewModel> articles;

  NewsGrid({Key? key, required this.articles}) : super(key: key);

  void _showNewsArticleDetails(context, article) => navigation.navigateToPage(
      path: NavigationConstants.NEWS_DETAILS_WIEW, data: article);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        final article = articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              child: Stack(children: [
                CircleImages(
                  imageUrl: article.imageUrl,
                  imageRadius: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 0),
                              child: Text("Teknoloji",
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(color: Colors.white),
                                  maxLines: 1,
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
                                    tileMode: TileMode.clamp)),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 0),
                              child: Text(article.source,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      ?.copyWith(color: Colors.white),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 10),
                      child: Text(article.title,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: Colors.white),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis),
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
