import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/loading_images.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_view_model.dart';
import 'package:logger/logger.dart';

class NewsArticleDetailsView extends StatelessWidget {
  final NewsArticleViewModel article;
  const NewsArticleDetailsView({Key? key, required this.article})
      : super(key: key);

  void _showlog(String value) {
    var logger = Logger();
    logger.d("Logger: " + value);
  }

  @override
  Widget build(BuildContext context) {
    _showlog(this.article.description);
    return Scaffold(
      appBar: AppBar(
          title: Row(
        children: [
          SizedBox(width: 5),
          Container(
            constraints: BoxConstraints(
              maxWidth: 150,
            ),
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
                  this.article.author,
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
              ],
            ),
          )
        ],
      )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Divider(
                    color: Colors.white,
                    thickness: 20,
                    height: 20,
                  ),
                ],
              ),
              Text(this.article.title,
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      wordSpacing: 3)),
              SizedBox(
                height: 20,
              ),
              Text(
                this.article.publishedAt,
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                child: LoadingImages(
                  imageUrl: this.article.imageUrl,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(this.article.description,
                  style: TextStyle(fontSize: 16, wordSpacing: 3)),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
