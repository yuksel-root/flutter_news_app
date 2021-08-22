import 'package:flutter_news_app_with_api/core/navigation/navigation_service.dart';
import 'package:flutter_news_app_with_api/core/notifier/connectivity_notifier.dart';
import 'package:flutter_news_app_with_api/core/notifier/tabbar_navigation_notifier.dart';
import 'package:flutter_news_app_with_api/view_models/login_view_model.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:flutter_news_app_with_api/view_models/news_country_settings_view_model.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';
import 'bottom_navigation_notifier.dart';

class ApplicationProvider {
  static ApplicationProvider? _instance;
  static ApplicationProvider get instance {
    _instance ??= ApplicationProvider._init();
    return _instance!;
  }

  ApplicationProvider._init();
  List<SingleChildWidget> dependItems = [
    ChangeNotifierProvider(
      create: (context) => LoginViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ConnectivityProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => NewsArticleListViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => BottomNavigationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TabbarNavigationProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => NewsCountrySettingsViewModel(),
    ),
    Provider.value(value: NavigationService.instance)
  ];
}
