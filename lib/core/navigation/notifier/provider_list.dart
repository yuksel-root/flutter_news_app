import 'package:flutter_news_app_with_api/core/navigation/notifier/bottom_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:flutter_news_app_with_api/core/navigation/notifier/tabbar_navigation_notifier.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import '../navigation_service.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => NewsArticleListViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => BottomNavigationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TabbarNavigationProvider(),
    ),
    Provider.value(value: NavigationService.instance)
  ];
}
