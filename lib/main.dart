import 'package:flutter/material.dart';
import 'package:flutter_news_app_with_api/view/news_article_view.dart';
import 'package:flutter_news_app_with_api/view_models/news_article_list_view_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
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
        child: NewsView(),
      ),
    );
  }
}
