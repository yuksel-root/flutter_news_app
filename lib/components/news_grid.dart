import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/loading_images.dart';
import 'package:flutter_news_app_with_api/view/news_article_details_view.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_view_model.dart';

class NewsGrid extends StatelessWidget {
  final List<NewsArticleViewModel> articles;
  const NewsGrid({Key? key, required this.articles}) : super(key: key);

  void _showNewsArticleDetails(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return NewsArticleDetailsView(
        article: article,
      );
    }));
  }

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
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: LoadingImages(
                  imageUrl: article.imageUrl,
                ),
              ),
              footer: Container(
                padding: const EdgeInsets.symmetric(horizontal: 13),
                child: Text(article.title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis),
              )),
        );
      },
      itemCount: articles.length,
    );
  }
}
