import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/constants/navigation_constants.dart';
import 'package:flutter_news_app_with_api/view/news_article_details_view.dart';
import 'package:flutter_news_app_with_api/view/news_article_view.dart';

class NavigationRoute {
  static final NavigationRoute _instance = NavigationRoute._init();
  static NavigationRoute get instance => _instance;

  NavigationRoute._init();

  Route<dynamic> generateRoute(RouteSettings settings) {
    print('Generating route: ${settings.name}');
    switch (settings.name) {
      case NavigationConstants.HOME_VIEW:
        print('aaaaaaaa');
        return pageNavigate(NewsView());

      case NavigationConstants.NEWS_DETAILS_WIEW:
        return pageNavigate(NewsDetailsView(article: null));
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Text('Route NOT FOUND!'),
            ),
          ),
        );
    }
  }

  MaterialPageRoute pageNavigate(Widget widget) => MaterialPageRoute(
        builder: (context) => widget,
      );
}
