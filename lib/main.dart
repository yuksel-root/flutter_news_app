import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/core/preferences/shared_manager.dart';
import 'package:flutter_news_app_with_api/view/news_article_view.dart';
import 'package:flutter_news_app_with_api/view/tabbar_view.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedManager.instance.initPreferences();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter News App',
      theme: ThemeData(
          primarySwatch: Colors.deepPurple,
          appBarTheme: AppBarTheme(
              color: Colors.deepPurple,
              elevation: 0,
              actionsIconTheme: IconThemeData(color: Colors.white)),
          textTheme: TextTheme(headline6: TextStyle(color: Colors.black))),
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => NewsArticleListViewModel(),
          ),
        ],
        child: NewsTabbarView(),
      ),
    );
  }
}
