import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/circle_images.dart';
import 'package:flutter_news_app_with_api/core/extension/context_extension.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_view_model.dart';

class NewsArticleDetailsView extends StatelessWidget {
  final NewsArticleViewModel article;
  const NewsArticleDetailsView({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          SizedBox(width: 5),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Source',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
                Text(
                  this.article.source,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          )
        ],
      )),
      body: ListView(children: [
        SizedBox(
          height: context.dynamicHeight(0.35),
          child: CircleImages(
            imageUrl: this.article.imageUrl,
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
              Text(this.article.title,
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(
                height: context.dynamicHeight(0.025),
              ),
              FittedBox(
                child: Row(
                  children: [
                    SizedBox(width: context.dynamicWidth(0.01)),
                    Text(
                      this.article.publishedAt,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          ?.copyWith(color: Colors.grey),
                    ),
                    SizedBox(width: context.dynamicWidth(0.50)),
                    Text(
                      this.article.author,
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
              Text(this.article.description,
                  style: Theme.of(context).textTheme.subtitle1),
            ],
          ),
        ),
      ]),
    );
  }
}
