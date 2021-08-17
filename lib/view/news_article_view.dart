import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/components/news_error.dart';
import 'package:flutter_news_app_with_api/components/news_grid.dart';
import 'package:flutter_news_app_with_api/core/constants/api_constants.dart';
import 'package:flutter_news_app_with_api/core/extension/string_extension.dart';
import 'package:flutter_news_app_with_api/core/language/locale_keys.g.dart';
import 'package:flutter_news_app_with_api/core/notifier/connectivity_notifier.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

class NewsView extends StatelessWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xe61c0f45),
        body: context.watch<ConnectivityProvider>().isConnected != null
            ? context.watch<ConnectivityProvider>().isConnected == true
                ? context.watch<NewsArticleListViewModel>().state ==
                        ArticleState.searching
                    ? buildLoadingWidget()
                    : context.watch<NewsArticleListViewModel>().state ==
                            ArticleState.error
                        ? NewsError(
                            errorText: LocaleKeys.errors_fetchDataError.locale,
                            refreshText: LocaleKeys.refreshScreen_text.locale,
                          )
                        : buildColumnExpandedNewsGrid(context)
                : NewsError(
                    errorText: LocaleKeys.errors_noInternetError_text.locale,
                    refreshText: LocaleKeys.refreshScreen_text.locale,
                  )
            : buildLoadingWidget());
  }

  Column buildColumnExpandedNewsGrid(BuildContext context) {
    final listArticles = context.read<NewsArticleListViewModel>().articles;

    final categories = ApiConstants().getAllCategories();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: NewsGrid(
            articles: listArticles,
            categories: categories,
          ),
        ),
      ],
    );
  }

  Center buildLoadingWidget() => Center(
          child: CircularProgressIndicator(
        color: Colors.green,
      ));
}
