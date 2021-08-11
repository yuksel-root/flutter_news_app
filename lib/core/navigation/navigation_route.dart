import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/navigation_constants.dart';
import 'package:flutter_news_app_with_api/services/api_service.dart';
import 'package:flutter_news_app_with_api/view/bottom_tabbar_view.dart';
import 'package:flutter_news_app_with_api/view/news_article_details_view.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_view_model.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings? settings) {
    print('Generating route: ${settings?.name}');

    switch (settings?.name) {
      case NavigationConstants.HOME_VIEW:
        print("BotomTabbarView");
        return pageNavigate(BottomTabbarView());
      case NavigationConstants.NEWS_DETAILS_WIEW:
        print("newsDetailView");
        if (settings?.arguments is NewsArticleViewModel) {
          return pageNavigate(NewsDetailsView(
            article: settings!.arguments as NewsArticleViewModel,
            categories: ApiService().getAllCategories(),
          ));
        }
        throw ("Article model is not Found");
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Route is  not Found'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute pageNavigate(Widget widget) => MaterialPageRoute(
        builder: (context) => widget,
      );
}
